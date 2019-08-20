
import 'package:meta/meta.dart';
import 'package:smart_dock_mobile/data/db/db.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
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
    print(map['Result']['Token']);
  
    
    return null;
  }

  /// Signup a new user with [FirstName], [LastName], [DOB], [Gender], [Email], [Password]
  ///
  /// Response user info if success. Otherwise throw error.
  Future<User> signup({String firstName, String lastName, String gender, String dob, String email, String password}) {
    return null;
  }

  /// Select current [user].
  ///
  /// [user] is null if there is no [user] inside database.
  Future<User> currentUser() async {
    return await this.db.selectUser();
  }

  Future<bool> logout() async {
    return true;
  }

}