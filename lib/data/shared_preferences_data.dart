import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesData {
  // --- KEYS ---
  static const String accessToken = "accessToken";
  static const String refreshToken = "refreshToken";
  static const String savedEmail = "savedEmail";
  static const String savedPassword = "savedPassword";
  static const String rememberMe = "rememberMe";

  // --- ACCESS TOKEN ---
  Future<void> setAccessToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(accessToken, token);
  }

  Future<String?> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(accessToken);
  }

  // --- REFRESH TOKEN ---
  Future<void> setRefreshToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(refreshToken, token);
  }

  Future<String?> getRefreshToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(refreshToken);
  }

  // --- SAVED EMAIL ---
  Future<void> setSavedEmail(String email) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(savedEmail, email);
  }

  Future<String?> getSavedEmail() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(savedEmail);
  }

  // --- SAVED PASSWORD ---
  Future<void> setSavedPassword(String password) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(savedPassword, password);
  }

  Future<String?> getSavedPassword() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(savedPassword);
  }

  // --- REMEMBER ME ---
  Future<void> setRememberMe(bool value) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool(rememberMe, value);
  }

  Future<bool> getRememberMe() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(rememberMe) ?? false;
  }

  // --- CLEARING DATA ---
  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessToken);
    await prefs.remove(refreshToken);
  }

  Future<void> clearSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(savedEmail);
    await prefs.remove(savedPassword);
    await prefs.remove(rememberMe); // Also clear the remember me flag
  }
}
