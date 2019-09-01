
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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

class LoginGoogleButtonPressed extends LoginEvent {
  final String fullName;
  final String email;
  final String socialID;
  final String socialToken;
  final int socialType;

  LoginGoogleButtonPressed({
    this.fullName, 
    @required this.email,
    @required this.socialID,
    @required this.socialToken,
    @required this.socialType}) : super([fullName, email, socialID, socialToken, socialType]);

  @override
  String toString() => 'LoginGoogleButtonPressed { fullName: $fullName, email: $email }';

}