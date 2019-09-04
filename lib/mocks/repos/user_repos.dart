import 'package:smart_dock_mobile/data/db/db.dart';
import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';
import 'package:smart_dock_mobile/services/api.dart';

class MockUserRepository extends BaseUserRepository {
  final DB db;
  final API api;

  MockUserRepository({this.db, this.api});

  @override
  Future<User> authenticate({String email, String password}) {
    // TODO: implement authenticate
    return null;
  }

  @override
  Future<User> authenticateSocialAccount({String fullName, String email, String socialID, String socialToken, int socialType}) {
    // TODO: implement authenticateSocialAccount
    return null;
  }

  @override
  Future<User> currentUser() {
    // TODO: implement currentUser
    return null;
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    return null;
  }

  @override
  Future<User> signup({String firstName, String lastName, String gender, String dob, String email, String password}) {
    // TODO: implement signup
    return null;
  }

}