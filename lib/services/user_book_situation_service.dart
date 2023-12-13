import 'package:bookbuzz/data/models/user_book_situation.dart';
import 'package:bookbuzz/data/repositories/user_book_situation_api.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBookSituationService {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UserBookSituationService();

  Future<List<UserBookSituation>?> getMyReadBooks() async {
    try {
      final prefs = await _prefs;
      final token = prefs.getString("token");
      if (token?.isNotEmpty == true) {
        final decodedToken = JwtDecoder.decode(token!);
        final currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        if (currentTimestamp < decodedToken['exp'] &&
            decodedToken['id'] != null) {
          final user =
              await UserBookSituationApi.findAll(userId: decodedToken['id']);
          return user;
        } else {
          throw Exception('Invalid or expired token');
        }
      } else {
        throw Exception('Token not found');
      }
    } catch (e) {
      print('Error in getMyReadBooks: $e');
      return null;
    }
  }

  Future<UserBookSituation?> create(String bookId, int status) async {
    try {
      final prefs = await _prefs;
      final token = prefs.getString("token");
      if (token?.isNotEmpty == true) {
        final decodedToken = JwtDecoder.decode(token!);
        final currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        if (currentTimestamp < decodedToken['exp'] &&
            decodedToken['id'] != null) {
          final user = await UserBookSituationApi.create(bookId, status);
          return user;
        } else {
          throw Exception('Invalid or expired token');
        }
      } else {
        throw Exception('Token not found');
      }
    } catch (e) {
      print('Error in create: $e');

      return null;
    }
  }

  Future<UserBookSituation?> getBookSituation(String id) async {
    try {
      final prefs = await _prefs;
      final token = prefs.getString("token");
      if (token?.isNotEmpty == true) {
        final decodedToken = JwtDecoder.decode(token!);
        final currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        if (currentTimestamp < decodedToken['exp'] &&
            decodedToken['id'] != null) {
          final user = await UserBookSituationApi.findAll(
            userId: decodedToken['id'],
            bookId: id,
          );
          return user.firstOrNull;
        } else {
          throw Exception('Invalid or expired token');
        }
      } else {
        throw Exception('Token not found');
      }
    } catch (e) {
      print('Error in getMyReadBooks: $e');
      return null;
    }
  }

  Future<UserBookSituation?> updateBookSituation(int id, int status) async {
    try {
      final prefs = await _prefs;
      final token = prefs.getString("token");

      if (token?.isNotEmpty == true) {
        final decodedToken = JwtDecoder.decode(token!);
        final currentTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        if (currentTimestamp < decodedToken['exp'] &&
            decodedToken['id'] != null) {
          final user = await UserBookSituationApi.updateById(id, status);
          return user;
        } else {
          throw Exception('Invalid or expired token');
        }
      } else {
        throw Exception('Token not found');
      }
    } catch (e) {
      print('Error in updateBookSituation: $e');
      return null;
    }
  }
}
