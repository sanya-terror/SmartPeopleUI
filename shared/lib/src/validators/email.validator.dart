class EmailValidator {
  static bool validate(String value) {

    if (value == null) return false;

    var regex = new RegExp(
        '^[a-z0-9!#\$%&\'*+\/=?^_`{|}~.-]+@[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)*',
        caseSensitive: false);

    return regex.hasMatch(value);
  }
}
