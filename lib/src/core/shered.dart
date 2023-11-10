import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _keyLoggedIn = 'loggedIn';
  static const String _keyUserId = 'userId';
  static const String _keyAccessToken = 'accessToken';

  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool isLoggedIn() {
    return _prefs?.getBool(_keyLoggedIn) ?? false;
  }

  static String getUserId() {
    return _prefs?.getString(_keyUserId) ?? '';
  }

  static String getAccessToken() {
    return _prefs?.getString(_keyAccessToken) ?? '';
  }

  static Future<void> setLoggedIn(bool value) async {
    await _prefs?.setBool(_keyLoggedIn, value);
  }

  static Future<void> setUserInfo(String userId, String accessToken) async {
    await _prefs?.setString(_keyUserId, userId);
    await _prefs?.setString(_keyAccessToken, accessToken);
  }

  static Future<void> clearSession() async {
    await _prefs?.clear();
  }
}