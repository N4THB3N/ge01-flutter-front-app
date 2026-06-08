// lib/config/session_manager.dart
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static String? authToken;
  static int? userId;
  static String? userEmail;

  // Save token after login
  static Future<void> setToken(String token) async {
    authToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);

  }

  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('auth_token');
  }

  // Clear on logout
  static void clear() {
    authToken = null;
    userId = null;
    userEmail = null;
  }
}