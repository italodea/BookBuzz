import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/data/repositories/user_book_situation_api.dart';
import 'package:bookbuzz/data/repositories/users_api.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {
  ProfileService();
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<User?> getMySimpleProfile() async {
    try {
      if (await AuthService().isValidSession()) {
        Map<String, dynamic> decodedToken =
            await AuthService().getDataFromToken();
        User? user = await UsersApi.findById(decodedToken['id']);
        return user;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<User?> getMyProfile() async {
    try {
      if (await AuthService().isValidSession()) {
        Map<String, dynamic> decodedToken =
            await AuthService().getDataFromToken();
        int currentTimestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000);
        if (currentTimestamp < decodedToken['exp'] &&
            decodedToken['id'] != null) {
          User? user = await UsersApi.findById(decodedToken['id']);

          // Requisições paralelas
          var results = await Future.wait([
            UserBookSituationApi.findAll(
                userId: decodedToken['id'], statusId: 1),
            UserBookSituationApi.findAll(
                userId: decodedToken['id'], statusId: 2),
            UserBookSituationApi.findAll(
                userId: decodedToken['id'], statusId: 3),
            UserBookSituationApi.findAll(
                userId: decodedToken['id'], statusId: 4),
          ]);

          user?.wishBooks = results[0];
          user?.readingBooks = results[1];
          user?.readBooks = results[2];
          user?.droppedBooks = results[3];

          return user;
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  Future<User?> editProfile(User user) async {
    try {
      SharedPreferences prefs = await _prefs;
      String? token = prefs.getString("token");
      if (token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        int currentTimestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000);
        if (currentTimestamp < decodedToken['exp'] &&
            decodedToken['id'] != null) {
          if (user != null) {
            await UsersApi.updateUser(
              id: user.id,
              name: user.name,
              url_photo: user.urlPhoto,
            );
            return user;
          }
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<User?> getFromId(int id) async {
    try {
      if (id > 0) {
        if (await AuthService().isValidSession()) {
          User? user = await UsersApi.findById(id);
          return user;
        }
      }

      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
