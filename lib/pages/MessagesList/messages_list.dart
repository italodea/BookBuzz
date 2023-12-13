// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/data/models/chat.dart';
import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/services/message_service.dart';
import 'package:bookbuzz/data/models/message.dart';
import 'package:bookbuzz/pages/MessagesList/components/input_message_widget.dart';
import 'package:bookbuzz/pages/MessagesList/components/message_bubble_widget.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:bookbuzz/services/profile_service.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({Key? key, this.chat}) : super(key: key);

  final Chat? chat;
  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  final MessageService messageService =
      MessageService(ff: FirebaseFirestore.instance);

  final TextEditingController messageEditingController =
      TextEditingController();

  User? user;

  Map<int, User> participants = {};

  Chat? chat;

  List<QueryDocumentSnapshot> messageList = [];

  final ScrollController scrollController = ScrollController();

  currentUser(context) => ModalRoute.of(context)?.settings.arguments as String;

  Future<int> getCurrentUserId() async {
    var id = await AuthService().getDataFromToken();
    var u = await ProfileService().getMySimpleProfile();
    setState(() {
      user = u;
    });
    return id['id'];
  }

  void getCurrentChat() {
    var c = ModalRoute.of(context)!.settings.arguments as Chat;
    setState(() {
      chat = c;
    });
  }

  @override
  initState() {
    super.initState();
    getCurrentUserId();
  }

  Future<void> sendMessage(String message, String imagePath) async {
    if (message.isNotEmpty || imagePath.isNotEmpty) {
      messageEditingController.clear();
      messageService.sendMessage(
          user!, message.trim(), chat?.id ?? "", imagePath);
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    getCurrentChat();
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Mensagens'),
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        elevation: 2,
        shadowColor: Colors.black26,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/background_chat.jpg',
            repeat: ImageRepeat.repeat,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            children: <Widget>[
              Flexible(
                child: StreamBuilder<QuerySnapshot>(
                  stream: messageService.getMessages(chat!.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      messageList = snapshot.data!.docs;

                      if (messageList.isNotEmpty) {
                        return ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: messageList.length,
                          reverse: true,
                          controller: scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            return FutureBuilder(
                              future: _buildItem(index, messageList[index]),
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  return snapshot.data as Widget;
                                }
                              },
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Container(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.foregroundColor,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Text(
                              'Sem mensagens...',
                              style: AppText.headlineSmall,
                            ),
                          ),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondaryColor,
                        ),
                      );
                    }
                  },
                ),
              ),
              InputMessageWidget(
                messageEditingController: messageEditingController,
                handleSubmit: sendMessage,
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildItem(int index, DocumentSnapshot? documentSnapshot) async {
    if (documentSnapshot != null) {
      final chatMessage = Message.fromDocument(documentSnapshot);
      ;
      if (participants[chatMessage.author] == null) {
        participants[chatMessage.author] =
            (await ProfileService().getFromId(chatMessage.author))!;
      }

      final isMe = user!.id == participants[chatMessage.author]!.id;
      return MessageBubbleWidget(
        chatMessage: chatMessage,
        isMe: isMe,
        user: participants[chatMessage.author]!,
      );
    }
  }
}
