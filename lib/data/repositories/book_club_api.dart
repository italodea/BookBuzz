import 'dart:convert';

import 'package:bookbuzz/data/models/book_club.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'api.dart';

class BookClubApi {
  static Future<List<BookClub>> findAll() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");

      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': "Bearer $token"};
      }
      List<BookClub> bookClubList = [];

      var url = Uri.parse("${MyAPI.BASE_URL}/bookclub/");
      var request = http.Request('GET', url);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(await response.stream.bytesToString());
        for (var bookClub in body) {
          BookClub newBookClub = BookClub.fromJson(bookClub);

          bookClubList.add(newBookClub);
        }
      } else {
        print("book_club_api:35 findAll -> ${response.reasonPhrase}");
      }

      return bookClubList;
    } catch (e) {
      print("book_club_api:40 findAll -> $e");
      return List.empty();
    }
  }

  static Future<BookClub?> findById(int id) async {
    BookClub? newBookClub;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");

      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': "Bearer $token"};
      }

      var url = Uri.parse("${MyAPI.BASE_URL}/bookclub/$id");
      var request = http.Request('GET', url);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> body =
            jsonDecode(await response.stream.bytesToString());
        newBookClub = BookClub.fromSingleJson(body);
      } else {
        print("book_club_api: findById -> ${response.reasonPhrase}");
      }
    } catch (e) {
      print("book_club_api: findById -> $e}");
    }
    return newBookClub;
  }

  static Future<BookClub?> create(
      int user_id, String name, String description, String imageUrl) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var request = http.Request(
          'POST', Uri.parse('https://api.italodea.com.br/api/bookclub/'));
      request.body = json.encode({
        "user_id": user_id,
        "name": name,
        "imageUrl": imageUrl,
        "description": description
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> body =
            jsonDecode(await response.stream.bytesToString());

        BookClub newBookClub = BookClub.fromJson(body);
        return newBookClub;
      } else {
        print("book_club_api:102 create -> ${response.reasonPhrase}");
      }
      return null;
    } catch (e) {
      print("book_club_api: 106 create -> $e}");
    }
    return null;
  }

  static Future<BookClub?> deleteClub(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString("token");

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      };
      var request = http.Request(
          'DELETE', Uri.parse('https://api.italodea.com.br/api/bookclub/$id'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
      return null;
    } catch (e) {
      print("book_club_api: 106 create -> $e}");
    }
    return null;
  }
}
