
import 'package:dio/dio.dart';

class API {

  static final API _singleton = new API._internal();
  Dio _dio;

  factory API() {
    return _singleton;
  }

  API._internal() {
    _dio = Dio();
  }

  /// Call auth with [email], [password]
  ///
  /// Response jwt if success. Otherwise throw error
  Future<void> auth(String email, String password) async {
    return await _dio.post("/auth/login", data: {"Email": email, "Password": password});
  }
}

final api = new API();