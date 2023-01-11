abstract class Validator {
  static bool isPassword(String em) {
    return em.length > 4 ? true : false;
  }

      String? validateVin(String? fieldContent) {
    String value = fieldContent ?? '';
    if (value.isNotEmpty && value.length > 4) {
          fieldContent = value;
        } else if (value.isEmpty) {
          return "This field can't be empty";
        } else {
          return "VIN is invalid";
        }
        return null;
  }
  String? validatePassword(String? fieldContent) {
    String value = fieldContent ?? '';
    if (value.isNotEmpty && isPassword(value)) {
          fieldContent = value;
        } else if (value.isEmpty) {
          return "This field can't be empty";
        } else {
          return "VIN is invalid";
        }
        return null;
  }
}
