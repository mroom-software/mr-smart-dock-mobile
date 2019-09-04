import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';

class MockUserRepository extends BaseUserRepository {
  Future<User> user;
  Future<bool> isLogout;

  MockUserRepository();

  @override
  Future<User> authenticate({String email, String password}) {
    return user;
  }

  @override
  Future<User> authenticateSocialAccount({String fullName, String email, String socialID, String socialToken, int socialType}) {
    return user;
  }

  @override
  Future<User> currentUser() {
    return user;
  }

  @override
  Future<bool> logout() {
    return isLogout;
  }

  @override
  Future<User> signup({String firstName, String lastName, String gender, String dob, String email, String password}) {
    return user;
  }

}