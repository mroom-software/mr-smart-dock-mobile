
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

  /// Call auth social account with [email], [password]
  ///
  /// Response jwt if success. Otherwise throw error
  Future<Response> authSocialAccount(String fullName, String email, String socialID, String socialToken, int socialType) async {
    return await _dio.post("/auth/social-login", data: {"FullName": fullName, "Email": email, "SocialID": socialID, "SocialToken": socialToken, "SocialType": socialType});
  }

  /// Call signup with [firstName], [lastName], [dob], [gender], [email], [password]
  ///
  /// Response user info if success. Otherwise throw error
  Future<Response> signup({String firstName, String lastName, String dob, String gender, String email, String password}) async {
    return await _dio.post("/auth/register", data: {"FirstName": firstName, "LastName": lastName, "DOB": dob, "Gender": gender, "Email": email, "Password": password, "ConfirmPassword": password});
  }

  /// Get user info based on [token]
  ///
  /// Response user info if success. Otherwise throw error
  Future<Response> userInfo(String token) async {
    _dio.options.headers['Authorization'] = 'Bearer ' + token;
    return await _dio.get("/user/profile");
  }

  /// Get water goal based on [working hours] of [user]
  ///
  /// Response goal of water. 
  Future<Response> userWaterGoal({String workingHours, String token}) async {
    _dio.options.headers['Authorization'] = 'Bearer ' + token;
    return await _dio.post("/user/calculate-water-goal", data: {"WorkingHours": workingHours});
  }

}

final api = new API();