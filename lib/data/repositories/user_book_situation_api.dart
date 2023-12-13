import 'dart:convert';
import 'package:bookbuzz/data/models/user_book_situation.dart';
import 'package:bookbuzz/data/repositories/api.dart';
import 'package:bookbuzz/data/repositories/google_books_api.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserBookSituationApi {
  static Future<List<UserBookSituation>> findAll(
      {int? userId, String? bookId, int? statusId}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");

      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': "Bearer $token"};
      }
      List<UserBookSituation> bookList = [];

      var url = Uri.parse("${MyAPI.BASE_URL}/user_book_situation/");

      Map<String, String> queryParams = {};
      if (userId != null) {
        queryParams['user_id'] = userId.toString();
      }
      if (bookId != null) {
        queryParams['book_id'] = bookId;
      }
      if (statusId != null) {
        queryParams['status_id'] = statusId.toString();
      }
      if (queryParams.isNotEmpty) {
        url = Uri.parse('$url?${Uri(queryParameters: queryParams).query}');
      }

      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(await response.stream.bytesToString());

        for (var book in body) {
          // print(book);
          UserBookSituation newBook = UserBookSituation.fromJson(book);
          newBook.book = await GoogleBooksApi.getBookById(newBook.bookId);
          bookList.add(newBook);
        }
        if (bookId != null) {}
      } else {
        print("user_book_situation_api: findAll -> ${response.reasonPhrase}");
      }
      return bookList;
    } catch (e) {
      print("user_book_situation_api: findAll -> $e");
      return List.empty();
    }
  }

  static Future<UserBookSituation?> create(String bookId, int status) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");
      Map<String, dynamic> dataToken = await AuthService().getDataFromToken();

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var request = http.Request(
          'POST', Uri.parse("${MyAPI.BASE_URL}/user_book_situation/"));
      request.body = json.encode({
        "status_id": status,
        "user_id": dataToken['id'],
        "book_id": bookId,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> body =
            jsonDecode(await response.stream.bytesToString());
        return UserBookSituation.fromJson(body);
      } else {
        print(
            "user_book_situation_api: updateById -> ${response.reasonPhrase}");
      }

      return null;
    } catch (e) {
      print("user_book_situation_api: create -> $e");
      return null;
    }
  }

  static Future<UserBookSituation?> updateById(int id, int status) async {
    try {
      if (status == 0) {
        await deleteById(id);
        return null;
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var request = http.Request(
          'PUT', Uri.parse("${MyAPI.BASE_URL}/user_book_situation/$id"));
      request.body = json.encode({"status_id": status});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> body =
            jsonDecode(await response.stream.bytesToString());
        return UserBookSituation.fromJson(body);
      } else {
        print(
            "user_book_situation_api: updateById -> ${response.reasonPhrase}");
      }

      return null;
    } catch (e) {
      print("user_book_situation_api: updateById -> $e");
      return null;
    }
  }

  static Future<void> deleteById(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");

      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': "Bearer $token"};
      }

      var request = http.Request(
          'DELETE', Uri.parse("${MyAPI.BASE_URL}/user_book_situation/$id"));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
      } else {
        print("user_book_situation_api: updateById -> $response.reasonPhrase");
      }
    } catch (e) {
      print("user_book_situation_api: updateById -> $e");
    }
  }
}
