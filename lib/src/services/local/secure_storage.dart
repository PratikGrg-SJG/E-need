// import 'package:app_agrobari/src/core/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static final SharedPreference _instance = SharedPreference._internal();

  factory SharedPreference() {
    return _instance;
  }

  SharedPreference._internal();
  static SharedPreferences? _sharedPreference;

  static init() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  static resetCredentials() async {
    await removeAuthToken();
    await removeUserId();
  }

  static deleteCredentials() async {
    await _sharedPreference?.remove("auth_token");
  }

  updateCredentials({String? token}) {
    setAuthToken(token.toString());
  }

  static getAuthToken() => _sharedPreference?.getString("auth_token");
  static getUserId() => _sharedPreference?.getInt("user_id");
  //token
  static setAuthToken(String authToken) async =>
      await _sharedPreference?.setString("auth_token", authToken);
  static setUserId(int userId) async =>
      await _sharedPreference?.setInt("user_id", userId);

  static removeAuthToken() async =>
      await _sharedPreference?.remove("auth_token");
  static removeUserId() async => await _sharedPreference?.remove("user_id");

  bool hasAuthToken() => _sharedPreference?.get("auth_token") != null;

  bool notLoggedIn() {
    return getAuthToken() == null;
  }
}
