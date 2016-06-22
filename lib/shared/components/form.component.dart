import 'package:angular2/common.dart';

class FormComponent {
  isValid(Control control) => control.untouched || control.valid;

  isRequired(Control control) =>
      !isValid(control) && control.errors.containsKey('required');

  isInsufficientLength(Control control) =>
      !isValid(control) && control.errors.containsKey('minlength');

  isLengthExcess(Control control) =>
      !isValid(control) && control.errors.containsKey('maxlength');

  hasRequiredError(Control control) =>
      isValid(control) || isRequired(control);

  hasRangeError(Control control) =>
      hasRequiredError(control) ||
      isInsufficientLength(control) ||
      isLengthExcess(control);

  isEqual(Control comparativeControl, Control controlToCompare) =>
      comparativeControl.value == controlToCompare.value;
}
