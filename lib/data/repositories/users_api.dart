import 'dart:convert';

import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/data/repositories/api.dart';
import 'package:bookbuzz/services/utils/my_json.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UsersApi {
  static Future<List<User>> findAll() async {
    List<User> usersList = [];

    var url = Uri.parse("${MyAPI.BASE_URL}/users/");

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        for (var user in body) {
          usersList.add(User.fromJson(user));
        }
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print("user_api: findAll -> $e");
    }

    return usersList;
  }

  static Future<User?> findById(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString("token");

    Map<String, String> headers = {};
    if (token != null) {
      headers = {'Authorization': "Bearer $token"};
    }
    User? user;

    var url = Uri.parse("${MyAPI.BASE_URL}/users/$id");

    try {
      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> body = MyJson.decode(response.bodyBytes);
        print(body);
        user = User.fromJson(body);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      print("user_api: findById -> $e");
    }

    return user;
  }

  static Future<void> create(
      {required name,
      required String email,
      required String password,
      required String url_photo}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse("${MyAPI.BASE_URL}/users/"));
    request.body = json.encode({
      "name": name,
      "email": email,
      "password": password,
      "url_photo": url_photo
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future<void> updateUser({
    required int id,
    required String name,
    required String url_photo,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token"
    };

    var request = http.Request('PUT', Uri.parse("${MyAPI.BASE_URL}/users/$id"));
    request.body = json.encode({
      "name": name,
      "url_photo": url_photo,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
