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

  //shared pref init
  // static Future sharedPrefInit() async =>
  //     _sharedPreference = await SharedPreferences.getInstance();

  static const _authToken = "auth_token";
  static const _cookieToken = "cookie_token";
  static const _firstTimeInApp = "first_time_in_app";
  static const _role = "role";
  static const _language = "language";

  static resetCredentials() async {
    _inMemoryToken = null;
    // await removeCookieToken();
    await removeAuthToken();
    await removeRole();
  }

  static deleteCredentials() async {
    _inMemoryToken = null;
    await _sharedPreference?.remove(_authToken);
  }

  updateCredentials({String? token}) {
    _inMemoryToken = null;
    setAuthToken(token.toString());
  }

  //token
  static setAuthToken(String authToken) async =>
      await _sharedPreference?.setString(_authToken, authToken);

  static setCookieToken(String cookieToken) async =>
      await _sharedPreference?.setString(_cookieToken, cookieToken);

  static String? get getSPToken => _sharedPreference?.getString(_authToken);

  static String? get getCookieToken =>
      _sharedPreference?.getString(_cookieToken);

  static removeAuthToken() async => await _sharedPreference?.remove(_authToken);

  static removeCookieToken() async =>
      await _sharedPreference?.remove(_cookieToken);

  bool hasAuthToken() => _sharedPreference?.get(_authToken) != null;

  // Use a memory cache to avoid local storage access in each call
  static String? _inMemoryToken;

  static String? getToken() {
    // use in memory token if available
    if (_inMemoryToken?.isNotEmpty ?? false) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = getSPToken;

    return _inMemoryToken;
  }

  //first time in app
  static bool get firstTimeInApp =>
      _sharedPreference?.getBool(_firstTimeInApp) ?? false;
  static setFirstTimeInApp() async =>
      await _sharedPreference?.setBool(_firstTimeInApp, true);
  static removeFirstTime() async =>
      await _sharedPreference?.remove(_firstTimeInApp);

  static String? get getLanguage => _sharedPreference?.getString(_language);
  static setLanguage(String language) async =>
      await _sharedPreference?.setString(_language, language);
  static removeLanguage() async => await _sharedPreference?.remove(_language);

  //role
  static void setRole(String role) async {
    await _sharedPreference?.setString(_role, role);
  }

  static removeRole() async {
    await _sharedPreference?.remove(_role);
  }

  static String? get getRole => _sharedPreference?.getString(_role);

  bool notLoggedIn() {
    return getSPToken == null;
  }
}
