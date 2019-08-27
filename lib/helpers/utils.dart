import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Utils {
  static final Utils _singleton = new Utils._internal();
  var storage;

  factory Utils() {
    return _singleton;
  }

  Utils._internal() {
    storage = new FlutterSecureStorage();
  }

  static bool isValidEmail(String email) {
    String p = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(p);
    return regExp.hasMatch(email);
  }

  Future<void> saveSecureData(String key, String value) async {
    storage.write(key: key, value: value);
  }

  Future<String> getSecureData(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deletSecureData(String key) async {
    await storage.delete(key: key);
  }
}

final utils = new Utils();

