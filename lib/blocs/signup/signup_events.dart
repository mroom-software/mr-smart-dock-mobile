
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

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
    @required this.firstName,
    @required this.lastName,
    @required this.gender,
    @required this.dob,
    @required this.email, 
    @required this.password,
  }) : super([firstName, lastName, gender, dob, email, password]);

  @override
  String toString() => 'SignupButtonPressed { fullname: $firstName $lastName, gender: $gender, dob: $dob, email: $email, password: $password }';

}