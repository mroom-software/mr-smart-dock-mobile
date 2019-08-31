
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_dock_mobile/data/validators/email_validator.dart';
import 'package:smart_dock_mobile/data/validators/password_validator.dart';

void main() {
  test('test email invalid returns error string', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email is invalid');

    result = EmailFieldValidator.validate('trongdth@gmail.com');
    expect(result, null);

  });

  test('test password empty returns error string', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password cannot be empty and at least 6 characters');

    result = PasswordFieldValidator.validate('123456');
    expect(result, null);
  });
}