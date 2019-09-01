
import 'package:meta/meta.dart';
import 'package:smart_dock_mobile/data/db/db.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/helpers/utils.dart';
import 'package:smart_dock_mobile/services/api.dart';

class UserRepository {
  final DB db;
  final API api;

  UserRepository({@required this.db, @required this.api, }) : assert(db != null), assert(api != null);

  /// Auth [email], [password]
  ///
  /// Response token if success. Otherwise throw error.
  Future<User> authenticate({
    @required String email,
    @required String password,
  }) async {

    var response = await api.auth(email, password);
    if (response.statusCode != 200) {
      return null;
    }

    Map<String, dynamic> map = response.data;
    String token = map['Result']['Token'];
    if (token.isNotEmpty) {
      response = await api.userInfo(token);
      map = response.data;
      User user = User.fromMap(map['Result']);
      this.db.insertUser(user);
      await utils.saveSecureData('token', token);
      return user;
    }    
    return null;
  }

  /// Auth [email], [password]
  ///
  /// Response token if success. Otherwise throw error.
  Future<User> authenticateSocialAccount({
    String fullName,
    @required String email,
    @required String socialID,
    @required String socialToken,
    @required int socialType,
  }) async {

    var response = await api.authSocialAccount(
      fullName, 
      email,
      socialID,
      socialToken,
      socialType
    );
    if (response.statusCode != 200) {
      return null;
    }

    Map<String, dynamic> map = response.data;
    String token = map['Result']['Token'];
    if (token.isNotEmpty) {
      response = await api.userInfo(token);
      map = response.data;
      User user = User.fromMap(map['Result']);
      this.db.insertUser(user);
      await utils.saveSecureData('token', token);
      return user;
    }    
    return null;
  }

  /// Signup a new user with [FirstName], [LastName], [DOB], [Gender], [Email], [Password]
  ///
  /// Response user info if success. Otherwise throw error.
  Future<User> signup({
    @required String firstName, 
    @required String lastName, 
    @required String gender,
    @required String dob, 
    @required String email, 
    @required String password}) async {
    

    var response = await api.signup(
      firstName: firstName,
      lastName: lastName,
      dob: dob,
      gender: gender,
      email: email,
      password: password,
    );
    if (response.statusCode != 200) {
      return null;
    }

    return await authenticate(email: email, password: password);
  }

  /// Select current [user].
  ///
  /// [user] is null if there is no [user] inside database.
  Future<User> currentUser() async {
    return await this.db.selectUser();
  }

  Future<bool> logout() async {
    await utils.deletSecureData('token');
    await this.db.deleteAllUsers();
    return true;
  }

}