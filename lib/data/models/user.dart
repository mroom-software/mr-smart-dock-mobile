
import 'package:meta/meta.dart';

class User {
  int id;
  String fullName;
  String firstName;
  String lastName;
  String email;
  String apiToken;
  String gender;
  String dob;
  int weight;
  int height;
  String workingHours;

  
  User({this.id,
   this.fullName,
   this.firstName, 
   this.lastName, 
   @required this.email, 
   this.apiToken,
   this.gender,
   this.dob,
   this.weight,
   this.height,
   this.workingHours});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'ID': id,
      'FullName': fullName,
      'FirstName': firstName,
      'LastName': lastName,
      'Email': email,
      'APIToken': apiToken,
      'DOB': dob,
      'Gender': gender,
      'Weight': weight,
      'Height': height,
      'WorkingHours': workingHours,
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
    dob = map['DOB'] as String;
    gender = map['DOB'] as String;
    weight = map['Weight'] as int;
    height = map['Height'] as int;
    workingHours = map['WorkingHours'] as String;
  }

  bool isNeedUpdateProfile() {
    if (weight == 0 || height == 0 || workingHours == "") {
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return ('id: ${this.id} - full name: ${this.fullName}');
  }

}