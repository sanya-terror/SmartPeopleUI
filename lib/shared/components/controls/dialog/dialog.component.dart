import 'package:angular2/angular2.dart' show Component, Input, ViewChild, ViewEncapsulation, Output, EventEmitter;

import 'package:SmartPeopleUI/shared/components/controls/dialog/rbi-dialog.dart' show DialogWrapper;

@Component(
    selector: 'sp-dialog',
    templateUrl: 'dialog.component.html',
    directives: const [DialogWrapper],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['rbi-dialog.css', 'dialog.component.css'])
class DialogComponent {
  @Input()
  String title;
  @Input()
  List<DialogAction> actions;

  @Output('close')
  EventEmitter onClose = new EventEmitter();

  @ViewChild(DialogWrapper)
  DialogWrapper dialog;

  showModal() {
    _subscribeOnClose();
    dialog.showModal();
  }

  show() {
    _subscribeOnClose();
    dialog.show();
  }

  close() {
    dialog.close();
  }

  _subscribeOnClose() {
    dialog.dialog.on['close'].take(1).listen(onClose.emit);
  }
}

class DialogAction {
  String title;
  Function execute;

  DialogAction(this.title, this.execute);
}
