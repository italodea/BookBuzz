import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/book_club_member.dart';
import 'api.dart';

class BookClubMembersApi {
  static Future<List<BookClubMember>> getMembers(
      {int? clubId, int? userId}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      Map<String, String> headers = {};
      if (token != null) {
        headers = {'Authorization': "Bearer $token"};
      }

      List<BookClubMember> bookClubMemberList = [];

      var url = Uri.parse("${MyAPI.BASE_URL}/bookclubmembers/");

      Map<String, String> queryParams = {};
      if (clubId != null) {
        queryParams['clubId'] = clubId.toString();
      }
      if (userId != null) {
        queryParams['userId'] = userId.toString();
      }
      if (queryParams.isNotEmpty) {
        url = Uri.parse('$url?${Uri(queryParameters: queryParams).query}');
      }

      var request = http.Request('GET', url);
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(await response.stream.bytesToString());
        for (var member in body) {
          BookClubMember newMember = BookClubMember.fromJson(member);
          bookClubMemberList.add(newMember);
        }
      } else {
        print("book_club_members_api:44 findAll -> ${response.reasonPhrase}");
      }
      return bookClubMemberList;
    } catch (e) {
      print("book_club_members_api:48 findAll -> $e");
      return List.empty();
    }
  }
}
