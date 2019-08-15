
class API {

  static final API _singleton = new API._internal();

  factory API() {
    return _singleton;
  }

  API._internal();

}

final api = new API();