
import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  SignupEvent([List props = const []]) : super(props);
}

class SignupButtonPressed extends SignupEvent {
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String email;
  final String password;

  SignupButtonPressed({
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.email, 
    this.password,
  }) : super([firstName, lastName, gender, dob, email, password]);

  @override
  String toString() => 'SignupButtonPressed { fullname: $firstName $lastName, gender: $gender, dob: $dob, email: $email, password: $password }';

}