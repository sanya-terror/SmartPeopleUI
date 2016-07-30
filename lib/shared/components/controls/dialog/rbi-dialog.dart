library dialog_widget;

/// with guidance from https://github.com/GoogleChrome/dialog-polyfill
/// and https://html.spec.whatwg.org/multipage/forms.html#the-dialog-element

import 'package:angular2/angular2.dart';
import 'dart:html';
import 'dart:async';
import 'package:SmartPeopleUI/shared/components/controls/dialog/dialog-manager.dart';

const int NORMAL_ALIGNMENT = 0;
const int CENTERED_ALIGNMENT = 1;
const int MAGIC_ALIGNMENT = 2;

@Component(
    selector: 'rbi-dialog',
    encapsulation: ViewEncapsulation.None,
    template: '<ng-content></ng-content>'
)
class DialogWrapper implements OnInit {
  @Input() String returnValue = '';
  @HostBinding('style.z-index') String dialogZ = '0';

  ElementRef elementRef;
  int alignment = NORMAL_ALIGNMENT;
  Element anchorElement;
  Element originalParent;
  int originalIndex;
  String oldAnchorPositionStyle;

  bool openAsModal = false;
  bool isNativeDialog = false;
  DialogManager dialogManager;
  StreamSubscription cancelListener;
  Element get dialog => elementRef.nativeElement;

  DialogWrapper(this.elementRef, this.dialogManager);

  void ngOnInit() {
    if (dialog is DialogElement) {
//      print("Can't upgrade <dialog>: already supported by browser");
      isNativeDialog = true;
    } else {
      dialog.attributes.remove('tabindex');
      restore();
      dialog.setAttribute('role', 'dialog');
    }
    originalParent = dialog.parent;
    originalIndex = dialog.parent.children.indexOf(dialog);
//    print('native dialog is $isNativeDialog');
  }

  void restore() {
    dialogZ = '10000';
    dialog.classes.remove('rbi-dialog-magic');
  }

  void setOpen(bool aValue) {
    if (aValue) {
      dialog.setAttribute('open', '');
      cancelListener = dialog.on['cancel'].listen((event) {
        if (dialog.attributes.containsKey('open')) {
          close();
        }
      });
    } else {
      dialog.attributes.remove('open');
      cancelListener.cancel();
      maybeHideModal();
    }
  }

  void setReturnValue(String aValue) {
    returnValue = aValue;
    if (isNativeDialog) {
      dialog.setAttribute('returnValue', aValue);
    }
  }

  // anchor currently can only be an Element
  // no anchor: it will be where it is in the document. You may position it
  // some other way, usually css
  void show([dynamic anchor = null]) {
    if (isNativeDialog) {
      DialogElement d = dialog;
      d.show();
      return;
    }

    Element parent = dialog.parent;
    if (parent != null) {
      String zix = parent.style.zIndex;
      if (zix.isNotEmpty) {
        num z = num.parse(parent.style.zIndex) + 1;
        dialogZ = '$z';
      }
    }
    anchorElement = null;
    alignment = NORMAL_ALIGNMENT;
    if (anchor != null) {
      setAlignment(anchor);
    }
    if (alignment != NORMAL_ALIGNMENT) {
      setPosition();
    }
    setOpen(true);
//    doAutofocus();
    if (alignment == MAGIC_ALIGNMENT) {
      dialog.scrollIntoView(ScrollAlignment.CENTER);
    }
  }

  void setPosition() {
    if (alignment == CENTERED_ALIGNMENT) {
      setCenteredPosition();
    } else if (alignment == MAGIC_ALIGNMENT) {
      dialog.classes.add('rbi-dialog-magic');
      setMagicPosition();
    }
  }

  void setAlignment(dynamic anchor) {
    if (anchor is MouseEvent) {
      throw new UnimplementedError('not dealing with mouse events yet');
    } else {
      anchorElement = anchor;
    }
    alignment = MAGIC_ALIGNMENT;
  }

  void setMagicPosition() {
    /// since 'anchor-point' is not really implemented anywhere,
    /// we will presume that we just want to drop the dialog into
    /// the target element.
    ///
    if (!anchorElement.children.contains(dialog)) {
      String anchorPositioning = anchorElement.style.position;
      if (['', 'static'].contains(anchorPositioning)) {
        oldAnchorPositionStyle = anchorPositioning;
        anchorElement.style.position = 'relative';
      }
      anchorElement.children.add(dialog);
    }
  }

  void setCenteredPosition() {}

  void doAutofocus() {
    Element target = dialog.querySelector('[autofocus]:not([disabled])');
    if (target == null) {
      List<String> newList = [];
      for (String item in ['button', 'input', 'keygen', 'select', 'textarea']) {
        newList.add('$item:not([disabled])');
      }
      target = dialog.querySelector(newList.join(', '));
    }
    if (target != null) {
      Timer.run(() {
        document.activeElement.blur();
        target.focus();
      });
    }
  }

  void showModal() {
    if (dialog.attributes.containsKey('open')) {
      print('showmodal called; already open');
      return;
    }
    if (isNativeDialog) {
      DialogElement d = dialog;
      d.showModal();
      return;
    }
    if (!dialogManager.pushDialog(this)) {
      print('showmodal called; too many open modal dialogs');
      return;
    }
    show();
    openAsModal = true;
  }

  void close([dynamic value = null]) {
//    print('closing dialog');
    if (isNativeDialog) {
      DialogElement d = dialog;
      d.close(value);
      return;
    }
    restore();
    if (!dialog.attributes.containsKey('open')) {
      print('cannot close dialog; no open attribute');
      return;
    }
    setOpen(false);
    alignment = NORMAL_ALIGNMENT;
    if (oldAnchorPositionStyle != null) {
      anchorElement.style.position = oldAnchorPositionStyle;
    }
    anchorElement = null;
    oldAnchorPositionStyle = null;
    if (value != null) {
      setReturnValue(value);
    }
//    print('Return value is $returnValue');
    CustomEvent closeEvent =
    new CustomEvent('close', canBubble: false, cancelable: false);
    dialog.dispatchEvent(closeEvent);
    if (openAsModal) {
      dialogManager.removeDialog(this);
    }
    if (!originalParent.children.contains(dialog)) {
      originalParent.children.insert(originalIndex, dialog);
    }
  }

  void maybeHideModal() {
    if (!openAsModal) {
      return;
    }
    if (dialog.attributes.containsKey('open') &&
        document.body.children.contains(dialog)) {
      return;
    }
    openAsModal = false;
    if (!isNativeDialog) {
      dialogManager.removeDialog(this);
    }
  }

  void updateZIndex(dynamic z) {
    dialogZ = '$z';
  }
}
