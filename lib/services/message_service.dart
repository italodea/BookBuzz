import 'package:bookbuzz/data/models/message.dart';
import 'package:bookbuzz/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  final FirebaseFirestore ff;

  MessageService({required this.ff});

  Stream<QuerySnapshot>? response;

  Stream<QuerySnapshot> getMessages(String chatId) {
    if(response != null) {
      return response!;
    }
    print("getting messages");
    return ff
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .where('chat_reference', isEqualTo: ff.doc('chats/$chatId'))
        .snapshots();
  }

  void sendMessage(
      User user, String message, String chatId, String image_path) async {
    DocumentReference chatReference = ff.collection('chats').doc(chatId);

    Message msg = Message(
      author: user.id,
      timestamp: Timestamp.now(),
      message: message,
      imagePath: image_path,
      chatReference: chatReference,
    );

    await ff.collection('messages').add(msg.toJson());
  }
}
