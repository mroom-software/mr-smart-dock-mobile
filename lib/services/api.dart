
import 'package:dio/dio.dart';
import 'package:smart_dock_mobile/config/config.dart';

class API {

  static final API _singleton = new API._internal();
  Dio _dio;

  factory API() {
    return _singleton;
  }

  API._internal() {
    _dio = Dio();
    _dio.options.baseUrl = Config.baseURL;
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
    _dio.options.responseType = ResponseType.json;
  }

  /// Call auth with [email], [password]
  ///
  /// Response jwt if success. Otherwise throw error
  Future<Response> auth(String email, String password) async {
    return await _dio.post("/auth/login", data: {"Email": email, "Password": password});
  }

  /// Get user info based on [token]
  ///
  /// Response user info if success. Otherwise throw error
  Future<Response> userInfo(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer ' + token;
    return await _dio.get("/user/profile");
  }

}

final api = new API();