import 'package:smart_dock_mobile/helpers/utils.dart';

class EmailFieldValidator {
  static String validate(String value) {
    if (!Utils.isValidEmail(value) || value.isEmpty) {
      return 'Email is invalid';
    }
    return null;
  }
}