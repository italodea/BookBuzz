import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  int author;
  String message;
  Timestamp timestamp;
  String imagePath;
  DocumentReference chatReference; // Novo campo de referência ao chat

  Message({
    required this.author,
    required this.message,
    required this.timestamp,
    this.imagePath = "",
    required this.chatReference, // Adicione ao construtor
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'message': message,
      'timestamp': timestamp,
      'image_path': imagePath,
      'chat_reference': chatReference, // Adicione ao mapa JSON
    };
  }

  factory Message.fromDocument(DocumentSnapshot documentSnapshot) {
    try {
      return Message(
        author: documentSnapshot.get('author'),
        message: documentSnapshot.get('message'),
        timestamp: documentSnapshot.get('timestamp'),
        imagePath: documentSnapshot.get('image_path'),
        chatReference:
            documentSnapshot.get('chat_reference'), // Adicione à fábrica
      );
    } catch (e) {
      return Message(
        author: documentSnapshot.get('author'),
        message: documentSnapshot.get('message'),
        timestamp: documentSnapshot.get('timestamp'),
        imagePath: "",
        chatReference:
            documentSnapshot.get('chat_reference'), // Adicione à fábrica
      );
    }
  }
}
