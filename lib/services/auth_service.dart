import '../models/user.dart';
import '../services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {
  final API _api = API();

  Future<User?> register(User user) async {
    return await _api.register(user);
  }

  Future<User?> login(String email, String password) async {
    return await _api.login(email, password);
  }

  Future<User?> yeniApiLogin(String email, String password) async {
    return await _api.yeniApiLogin(email, password);
  }

   Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all stored preferences
  }
}
