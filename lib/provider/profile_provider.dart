import 'package:bookbuzz/data/models/user_book_situation.dart';
import 'package:bookbuzz/services/user_book_situation_service.dart';
import 'package:flutter/material.dart';
import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/services/profile_service.dart';

class ProfileProvider with ChangeNotifier {
  final ProfileService _profileService = ProfileService();
  final UserBookSituationService _userBookSituationService = UserBookSituationService();
  User? _userProfile;
  List<UserBookSituation>? _myReadBooks;

  User? get userProfile => _userProfile;
  List<UserBookSituation>? get myReadBooks => _myReadBooks;

  Future<User?> fetchMyProfile() async {
    _userProfile = await _profileService.getMyProfile();
    notifyListeners();
    return _userProfile;
  }

  Future<void> getMySimpleProfile() async {
    _userProfile = await _profileService.getMySimpleProfile();
    notifyListeners();
  }

  Future<void> getMyProfile() async {
    _userProfile = await _profileService.getMyProfile();
    notifyListeners();
  }

  Future<void> editProfile(User user) async {
    _userProfile = await _profileService.editProfile(user);
    notifyListeners();
  }

  Future<void> getMyReadBooks() async {
    _myReadBooks = await _userBookSituationService.getMyReadBooks();
    notifyListeners();
  }
}
