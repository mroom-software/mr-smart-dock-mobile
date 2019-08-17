
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({this.email, this.password}) : super([email, password]);

  @override
  String toString() => 'LoginButtonPressed { email: $email, password: $password }';

}