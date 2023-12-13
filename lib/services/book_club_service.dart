import 'package:bookbuzz/services/auth_service.dart';

import '../data/models/book_club.dart';
import '../data/models/book_club_member.dart';
import '../data/repositories/book_club_api.dart';
import '../data/repositories/book_club_members_api.dart';

class BookClubService {
  BookClubService();

  // Future<List<BookClub>> getBookClubs() async {
  //   try {
  //     List<BookClub> bookClubList = await BookClubApi.findAll();
  //     return bookClubList;
  //   } catch (e) {
  //     return List.empty();
  //   }
  // }

  Future<List<BookClub>?> getClubsWhereImMember() async {
    try {
      Map<String, dynamic> myProfile = await AuthService().getDataFromToken();

      List<BookClubMember> bookClubMemberList =
          await BookClubMembersApi.getMembers(userId: myProfile['id']);

      List<BookClub> bookClubList = [];
      for (var member in bookClubMemberList) {
        BookClub? clube = await BookClubApi.findById(member.bookClubId);
        bookClubList.add(clube!);
      }
      return bookClubList;
    } catch (e) {
      return null;
    }
  }

  Future<List<BookClub>> getClubsWhereImNotMember() async {
    try {
      Map<String, dynamic> myProfile = await AuthService().getDataFromToken();

      List<BookClubMember> bookClubMemberList =
          await BookClubMembersApi.getMembers(userId: myProfile['id']);

      List<BookClub> bookClubList = await BookClubApi.findAll();
      for (var member in bookClubMemberList) {
        bookClubList.removeWhere((club) => club.id == member.bookClubId);
      }
      return bookClubList;
    } catch (e) {
      return List.empty();
    }
  }

  Future<BookClub?>? getById(int id) async {
    try {
      BookClub? bookClub = await BookClubApi.findById(id);
      return bookClub;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<BookClub?>? create(
      String name, String description, String imageUrl) async {
    try {
      Map<String, dynamic> data = await AuthService().getDataFromToken();
      return BookClubApi.create(
        data['id'],
        name,
        description,
        imageUrl,
      );
    } catch (e) {
      return null;
    }
  }
}
