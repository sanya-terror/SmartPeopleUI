import 'package:angular2/angular2.dart';
import 'dart:html';
import 'dart:async';
import 'package:smartpeople_client/shared/components/controls/dialog/rbi-dialog.dart';

@Injectable()
class DialogManager {
  List<DialogWrapper> pendingDialogStack = [];
  DivElement overlay;
  int zIndexLow = 100000;
  int zIndexHigh = 100000 + 150;
  StreamSubscription dmOverlayClick;
  StreamSubscription dmFocus;
  StreamSubscription dmKeyDown;

  DialogManager() {
    var dialogOverlayClassName = '_dialog_overlay';
    overlay = new DivElement()..classes.add(dialogOverlayClassName);

    dmOverlayClick = overlay.onClick.where((event) {
      var target = event.target as Element;

      return target.classes.contains(dialogOverlayClassName);
    }).listen((Event event) {
//      print('dm overlay clicked');
      event.stopPropagation();
      if (topDialog != null) {
        topDialog.doAutofocus();
      }
    });
//  same as document.addEventListener('submit', (Event event) {
//  handler...
//    }, true);
    Element.submitEvent.forTarget(document, useCapture: true).listen((event) {
      Element target = event.target;
      if (target == null ||
          !target.attributes.containsKey('method') ||
          target.getAttribute('method').toLowerCase() != 'dialog') {
        return;
      }
      event.preventDefault();
      Element dialog = _findNearestDialog(event.target);
      if (dialog == null) {
        return;
      }
      String returnValue;
      List<InputElement> candidates = [document.activeElement, event.target];
      List elementTypes = ['BUTTON', 'INPUT'];
      Iterable<InputElement> els = candidates.where((InputElement candidate) =>
          candidate != null &&
          candidate.form == event.target &&
          elementTypes.contains(candidate.nodeName.toUpperCase()));
      for (InputElement item in els) {
        returnValue = item.value;
      }
      wrapperFromElement(dialog).close(returnValue);
    });
  }

  DialogWrapper get topDialog => wrapperFromElement(topDialogElement());

  Element get modalAttachment {
    return overlay;
  }

  DialogWrapper wrapperFromElement(Element el) =>
      pendingDialogStack.firstWhere((DialogWrapper item) => item.dialog == el, orElse: () => null);

  Element topDialogElement() {
    if (pendingDialogStack.isNotEmpty) {
      return pendingDialogStack.last.dialog;
    }
    return null;
  }

  void blockDocument() {
    document.body.append(overlay);
    dmFocus = document.body.onFocus.listen((event) => handleFocus(event));
    dmKeyDown = document.onKeyDown.listen((event) => handleKey(event));
//    print('document blocked');
  }

  void unblockDocument() {
    document.body.children.remove(overlay);
    dmFocus.cancel();
    dmKeyDown.cancel();
    dmOverlayClick.cancel();
//    print('document unblocked');
  }

  void updateStacking() {
    int zIndex = zIndexLow;
    for (DialogWrapper item in pendingDialogStack) {
      if (item == pendingDialogStack.last) {
        overlay.style.zIndex = '${zIndex++}';
      }
      item.updateZIndex(zIndex++);
    }
  }

  void handleKey(KeyboardEvent event) {
    if (event.keyCode == KeyCode.ESC) {
      event
        ..preventDefault()
        ..stopPropagation();
      CustomEvent cancelEvent = new CustomEvent('cancel', canBubble: false, cancelable: true);
      topDialog.dialog.dispatchEvent(cancelEvent);
    }
  }

  bool handleFocus(FocusEvent event) {
//    print('using dm focus event');
    Element target = event.target;
    Element candidate = _findNearestDialog(target);
    if (candidate != topDialogElement() && topDialogElement() != null) {
      topDialog.doAutofocus();
      event
        ..preventDefault()
        ..stopPropagation();
      target.blur();
      return false;
    }
    return true;
  }

  bool pushDialog(DialogWrapper dialog) {
    num allowed = (zIndexHigh - zIndexLow) / 2 - 1;
    if (pendingDialogStack.length >= allowed) {
      return false;
    }
    modalAttachment.append(dialog.dialog);
    pendingDialogStack.add(dialog);
    if (pendingDialogStack.length == 1) {
      blockDocument();
    }
    updateStacking();
    return true;
  }

  void removeDialog(DialogWrapper dialog) {
    if (pendingDialogStack.contains(dialog)) {
      pendingDialogStack.remove(dialog);
      if (pendingDialogStack.isEmpty) {
        unblockDocument();
      } else {
        updateStacking();
      }
    } else {
      return;
    }
  }

  Element _findNearestDialog(Element el) {
//  print('finding nearest dialog');
    while (el != null) {
      if (el.classes.contains('rbi-dialog')) {
        return el;
      }
      el = el.parent;
    }
    return null;
  }
}
