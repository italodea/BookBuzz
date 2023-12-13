import 'package:flutter/material.dart';

import '../../services/user_book_situation_service.dart';
import '../models/user_book_situation.dart';

class UserBookSituationStore extends ChangeNotifier {
  UserBookSituation? userBookSituation;

  UserBookSituation? get getUserBookSituation => userBookSituation;

  void setBookSituation(UserBookSituation? value) {
    userBookSituation = value;
  }

  Future<UserBookSituation?> getBookSituation(String id) async {
    return await UserBookSituationService().getBookSituation(id);
  }

  Future<void> setUserBookSituation(int bookStatusId, String bookId) async {
    if (userBookSituation?.bookStatus != null) {
      await UserBookSituationService().updateBookSituation(
          userBookSituation!.bookStatus.id,
          userBookSituation!.bookStatus.id != bookStatusId ? bookStatusId : 0);
    } else {
      await UserBookSituationService().create(bookId, bookStatusId);
    }
    notifyListeners();
  }
}
