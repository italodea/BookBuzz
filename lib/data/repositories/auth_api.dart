import 'dart:convert';

import 'package:bookbuzz/data/models/auth.dart';
import 'package:bookbuzz/data/repositories/api.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future<Auth> login(String email, String password) async {
    Auth? auth;
    var request = http.Request('POST', Uri.parse("${MyAPI.AUTH_URL}/login"));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll({'Content-Type': 'application/json'});
    http.StreamedResponse response = await request.send();

    String body = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      auth = Auth.fromJson(jsonDecode(body));
    }
    return auth ?? Auth(email: '', token: '');
  }
}
