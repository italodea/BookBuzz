import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String id;
  int author;
  String bookId;
  String caption;
  int clubId;
  int page;
  Timestamp timestamp;

  Chat({
    this.id = '',
    required this.author,
    required this.bookId,
    this.caption = '',
    required this.clubId,
    this.page = 0,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'book_id': bookId,
      'caption': caption,
      'club_id': clubId,
      'page': page,
      'timestamp': timestamp,
    };
  }

  factory Chat.fromDocument(DocumentSnapshot documentSnapshot) {
    return Chat(
      id: documentSnapshot.id,
      author: documentSnapshot.get('author'),
      bookId: documentSnapshot.get('book_id'),
      caption: documentSnapshot.get('caption') ?? '',
      clubId: documentSnapshot.get('club_id'),
      page: documentSnapshot.get('page') ?? 0,
      timestamp: documentSnapshot.get('timestamp'),
    );
  }
}
