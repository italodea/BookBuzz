import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/data/models/book_status.dart';
import 'package:bookbuzz/data/models/user.dart';

class UserBookSituation {
  int id;
  User userId;
  String bookId;
  Book? book;
  BookStatus bookStatus;

  UserBookSituation(
      {required this.id,
      required this.userId,
      required this.bookId,
      required this.bookStatus});

  factory UserBookSituation.fromJson(Map<String, dynamic> element) {
    return UserBookSituation(
      id: element['id'],
      userId: User.fromJson(element['user_id']),
      bookId: element['book_id'],
      bookStatus: BookStatus.fromJson(element['book_status_id']),
    );
  }
}
