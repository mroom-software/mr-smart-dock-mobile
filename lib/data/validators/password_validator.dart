class PasswordFieldValidator {
  static String validate(String value) {
    return value.isEmpty || value.length < 6 ? 'Password cannot be empty and at least 6 characters' : null;
  }
}