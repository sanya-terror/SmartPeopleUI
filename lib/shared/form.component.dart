import 'package:angular2/common.dart';

class FormComponent{

   isValid(NgControlName control) => control.untouched || control.valid;

   isRequired(NgControlName control) => !isValid(control) && control.value.length == 0;

   isInsufficientLength(NgControlName control) => !isValid(control) && !isRequired(control) && control.value.length < 6;

   isLengthExcess(NgControlName control) => !isValid(control) && control.value.length > 18;

   isGeneralUnhandledError(NgControlName control) => !isValid(control) && !isRequired(control);

   isPasswordUnhandledError(NgControlName control) => !isValid(control) && !isRequired(control) && !isLengthExcess(control) && !isInsufficientLength(control);

   isNotEqual(NgControlName comparativeControl, NgControlName controlToCompare) => comparativeControl.value != controlToCompare.value;

}
