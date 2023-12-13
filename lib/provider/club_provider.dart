import 'package:bookbuzz/data/models/book_club.dart';
import 'package:bookbuzz/services/book_club_service.dart';
import 'package:flutter/material.dart';
import 'package:bookbuzz/data/models/user.dart';

class ClubProvider with ChangeNotifier {
  final BookClubService _clubService = BookClubService();
  List<BookClub> _bookClub = [];
  List<BookClub> get bookClub => _bookClub;

  Future<void> createClub(name, description, imageUrl) async {
    await _clubService.create(
      name,
      description,
      imageUrl,
    );
    notifyListeners();
  }

  Future<List<BookClub>?> getClubsWhereImMember() async {
    _bookClub = await _clubService.getClubsWhereImMember() ?? [];
    return _bookClub;
  }

  Future<void> getClubsWhereImMemberSimple() async {
    _bookClub = await _clubService.getClubsWhereImNotMember();
    notifyListeners();
  }
}
