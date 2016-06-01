import 'package:angular2/common.dart';

class FormComponent{

   isValid(NgControlName control) => control.untouched || control.valid;

   isRequired(NgControlName control) => !isValid(control) && control.errors.containsKey('required');

   isInsufficientLength(NgControlName control) => !isValid(control) && control.errors.containsKey('minlength');

   isLengthExcess(NgControlName control) => !isValid(control) && control.errors.containsKey('maxlength');

   isNonRequiredError(NgControlName control) => !isValid(control) && !isRequired(control);

   isNonRangeError(NgControlName control) => !isValid(control) && !isRequired(control) && !isLengthExcess(control) && !isInsufficientLength(control);

   isNotEqual(NgControlName comparativeControl, NgControlName controlToCompare) => comparativeControl.value != controlToCompare.value;

}
