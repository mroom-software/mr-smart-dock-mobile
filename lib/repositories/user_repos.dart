
import 'package:meta/meta.dart';
import 'package:smart_dock_mobile/data/db/db.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/helpers/utils.dart';
import 'package:smart_dock_mobile/services/api.dart';

abstract class BaseUserRepository {
  Future<User> authenticate({@required String email, @required String password,});
  Future<User> authenticateSocialAccount({String fullName, @required String email, @required String socialID, @required String socialToken, @required int socialType,});
  Future<User> signup({@required String firstName, @required String lastName, @required String gender, @required String dob, @required String email, @required String password});
  Future<User> currentUser();
  Future<bool> logout();
}

class UserRepository extends BaseUserRepository {
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

  /// Get water goal of [user].
  ///
  /// return [result] in ml/day
  Future<int> userWaterGoal(String workingHours) async {
    String token = await utils.getSecureData('token');
    var response = await api.userWaterGoal(
      token: token,
      workingHours: workingHours, 
    );
    if (response.statusCode != 200) {
      return 0;
    }

    Map<String, dynamic> map = response.data;
    return map['Result'];
  }

  /// Update profile of [user].
  ///
  /// return new instance of [user]
  Future<User> updateUserProfile({String workingHours, int weight, int height, int goal}) async {
    String token = await utils.getSecureData('token');
    var response = await api.updateUserProfile(
      token: token,
      workingHours: workingHours, 
      weight: weight,
      height: height,
      goal: goal,
    );
    if (response.statusCode != 200) {
      return null;
    }

    Map<String, dynamic> map = response.data;
    User user = User.fromMap(map['Result']);
    this.db.updateUser(user);

    return user;
  }

  /// Select current [user].
  ///
  /// [user] is null if there is no [user] inside database.
  Future<User> currentUser() async {
    return await this.db.selectUser();
  }

  /// clean [user] session
  Future<bool> logout() async {
    await utils.deletSecureData('token');
    await this.db.deleteAllUsers();
    return true;
  }

}