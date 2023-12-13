import 'package:bookbuzz/data/models/chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore ff;

  ChatService({required this.ff});

  Stream<QuerySnapshot> getChats(int clubId) {
    return ff
        .collection('chats')
        .where('club_id', isEqualTo: clubId)
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  void createChat(
      int clubId, String caption, int page, String bookId, int author) {
    Chat chat = Chat(
      author: author,
      bookId: bookId,
      caption: caption,
      clubId: clubId,
      page: page,
      timestamp: Timestamp.now(),
    );

    ff.collection('chats').add(chat.toJson());
  }
}
