import 'package:angular2/angular2.dart' show Component, Input, ViewChild, ViewEncapsulation, Output, EventEmitter;

import 'package:smartpeople_client/shared/components/controls/dialog/rbi-dialog.dart' show DialogWrapper;

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

  void showModal() {
    _subscribeOnClose();
    dialog.showModal();
  }

  void show() {
    _subscribeOnClose();
    dialog.show();
  }

  void close() {
    dialog.close();
  }

  void _subscribeOnClose() {
    dialog.dialog.on['close'].take(1).listen(onClose.emit);
  }
}

class DialogAction {
  String title;
  Function execute;

  DialogAction(this.title, this.execute);
}
