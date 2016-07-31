import 'package:angular2/common.dart';

class FormComponent {
  bool isValid(Control control) => control.untouched || control.valid;

  bool isRequired(Control control) => !isValid(control) && control.errors.containsKey('required');

  bool isInsufficientLength(Control control) => !isValid(control) && control.errors.containsKey('minlength');

  bool isLengthExcess(Control control) => !isValid(control) && control.errors.containsKey('maxlength');

  bool hasRequiredError(Control control) => isValid(control) || isRequired(control);

  bool hasRangeError(Control control) =>
      hasRequiredError(control) || isInsufficientLength(control) || isLengthExcess(control);

  bool isEqual(Control comparativeControl, Control controlToCompare) =>
    comparativeControl.value == controlToCompare.value;
}
