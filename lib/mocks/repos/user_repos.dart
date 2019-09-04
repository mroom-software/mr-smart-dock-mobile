import 'dart:async';

import 'package:smart_dock_mobile/data/models/user.dart';
import 'package:smart_dock_mobile/repositories/user_repos.dart';

class MockUserRepository extends BaseUserRepository {
  User user;
  bool isLogout;

  MockUserRepository();

  @override
  Future<User> authenticate({String email, String password}) {
    var completer = new Completer<User>();

    // At some time you need to complete the future:
    completer.complete(user);
    return completer.future;
  }

  @override
  Future<User> authenticateSocialAccount({String fullName, String email, String socialID, String socialToken, int socialType}) {
    var completer = new Completer<User>();

    // At some time you need to complete the future:
    completer.complete(user);
    return completer.future;
  }

  @override
  Future<User> currentUser() {
    var completer = new Completer<User>();

    // At some time you need to complete the future:
    completer.complete(user);
    return completer.future;
  }

  @override
  Future<bool> logout() {
    var completer = new Completer<bool>();

    // At some time you need to complete the future:
    completer.complete(isLogout);
    return completer.future;
  }

  @override
  Future<User> signup({String firstName, String lastName, String gender, String dob, String email, String password}) {
    var completer = new Completer<User>();

    // At some time you need to complete the future:
    completer.complete(user);
    return completer.future;
  }

}