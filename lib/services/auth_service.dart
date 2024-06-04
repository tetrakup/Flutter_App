import '../models/user.dart';
import '../services/api.dart';

class AuthService {
  final API _api = API();

  Future<User?> register(User user) async {
    return await _api.register(user);
  }

  Future<User?> login(String email, String password) async {
    return await _api.login(email, password);
  }
}
