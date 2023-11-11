class Const {
  static const String API = "https://sapi.cadot.eu"; //"http://10.0.2.2:32795";
  static const String API_TOKEN = API + "/api/login_check";
  static const String API_GETUSER = API + "/data/getUser/";
  static const HEADER_JSON = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };
}
