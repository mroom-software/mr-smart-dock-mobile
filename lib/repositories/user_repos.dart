

import 'package:meta/meta.dart';
import 'package:smart_dock_mobile/data/db/db.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/services/api.dart';

class UserRepository {
  final DB db;
  final API api;

  UserRepository({@required this.db, @required this.api, }) : assert(db != null && api != null);

  Future<User> authenticate({
    @required String email,
    @required String password,
  }) async {

    await Future.delayed(Duration(seconds: 1));
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