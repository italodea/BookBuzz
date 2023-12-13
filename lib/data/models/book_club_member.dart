import 'package:bookbuzz/data/models/user.dart';

class BookClubMember {
  int id;
  User userId;
  int bookClubId;
  bool isAdmin;

  BookClubMember({
    required this.id,
    required this.userId,
    required this.bookClubId,
    required this.isAdmin,
  });

  factory BookClubMember.fromJson(Map<String, dynamic> json) {
    return BookClubMember(
      id: json['id'],
      userId: User.fromJson(json['userId']),
      bookClubId: json['clubId'],
      isAdmin: json['is_admin'],
    );
  }
}
