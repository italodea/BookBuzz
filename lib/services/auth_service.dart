import 'package:bookbuzz/data/models/auth.dart';
import 'package:bookbuzz/data/repositories/auth_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AuthService();

  Future<bool> isValidSession() async {
    try {
      SharedPreferences prefs = await _prefs;
      String? token = prefs.getString("token");
      if (token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        int currentTimestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000);
        if (currentTimestamp < decodedToken['exp']) {
          return true;
        }
        prefs = await removeFromStorage();
      }
      prefs = await removeFromStorage();
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getDataFromToken() async {
    return JwtDecoder.decode((await _prefs).getString("token")!);
  }

  Future<bool> login(String email, String password) async {
    try {
      SharedPreferences prefs = await _prefs;

      Auth auth = await AuthApi.login(email, password);
      if (auth.email != '' && auth.token != '') {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(auth.token);
        prefs.setString("token", auth.token);
        prefs.setString("email", auth.email);
        prefs.setInt("user_id", decodedToken['id']);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await removeFromStorage();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<SharedPreferences> removeFromStorage() async {
    SharedPreferences prefs = await _prefs;

    await prefs.remove('token');
    await prefs.remove('email');
    await prefs.remove('user_id');

    return prefs;
  }
}
