class NameFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'Name cannot be empty' : null;
  }
}

class SSIDFieldValidator {
  static String validate(String value) {
    return value.isEmpty ? 'SSID cannot be empty' : null;
  }
}