
import 'package:meta/meta.dart';

class User {
  int id;
  String fullName;
  String firstName;
  String lastName;
  String email;
  String apiToken;

  
  User({this.id, this.fullName, this.firstName, this.lastName, @required this.email, this.apiToken });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ID': id,
      'FullName': fullName,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'APIToken': apiToken,
    };
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    id = map['ID'] as int;
    fullName = map['FullName'] as String;
    firstName = map['FirstName'] as String;
    lastName = map['LastName'] as String;
    email = map['Email'] as String;
    apiToken = map['APIToken'] as String;
  }

  @override
  String toString() {
    return ('id: ${this.id} - full name: ${this.fullName}');
  }

}