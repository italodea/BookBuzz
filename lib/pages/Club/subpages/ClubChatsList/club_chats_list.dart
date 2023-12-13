// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:bookbuzz/data/models/book_club.dart';
import 'package:bookbuzz/data/models/chat.dart';
import 'package:bookbuzz/pages/Club/subpages/ClubChatsList/components/book_club_discussion_widget.dart';
import 'package:bookbuzz/pages/Login/components/my_input_field.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:bookbuzz/services/chat_service.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClubChatsList extends StatefulWidget {
  ClubChatsList({super.key, required this.club});

  final BookClub club;

  @override
  State<ClubChatsList> createState() => _ClubChatsListState();
}

class _ClubChatsListState extends State<ClubChatsList> {
  List<QueryDocumentSnapshot> chatsList = [];

  final ChatService chatService = ChatService(ff: FirebaseFirestore.instance);
  final ScrollController scrollController = ScrollController();

  final AuthService authService = AuthService();

  final TextEditingController _charpterController = TextEditingController();
  final TextEditingController _pageController = TextEditingController();

  bool isCreatingChat = false;

  Future<void> createChat() async {
    if (_charpterController.text == "" && _pageController.text == "") {
      return;
    }
    setState(() {
      isCreatingChat = true;
    });
    chatService.createChat(
      widget.club.id,
      _charpterController.text,
      int.parse(
        _pageController.text != "" ? _pageController.text : "0",
      ),
      widget.club.currentBook.id,
      (await authService.getDataFromToken())['id'] ?? 0,
    );
    _charpterController.clear();
    _pageController.clear();
    setState(() {
      isCreatingChat = false;
    });
    Navigator.pop(context);
  }

  void _openModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 120,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/component2.png'),
                        Image.asset('assets/images/book1.png'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Iniciar discussão",
                    style: AppText.titleLarge,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Defina um capitulo e/ou uma página para iniciar a discussão para este livro",
                    style: AppText.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyInputField(
                    controller: _charpterController,
                    label: "Capitulo",
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  MyInputField(
                    controller: _pageController,
                    label: "Nº da página",
                    validator: (value) {
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondaryColor,
                            foregroundColor: AppColors.blackColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: createChat,
                          child: Text('Iniciar discussão'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                foregroundColor: AppColors.blackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _openModalBottomSheet,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text(
                    'Criar discussão',
                    style: AppText.bodyMedium,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                StreamBuilder(
                    stream: chatService.getChats(widget.club.id),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        chatsList = snapshot.data!.docs;
                        if (chatsList.isNotEmpty) {
                          return ListView.builder(
                              itemCount: chatsList.length,
                              reverse: true,
                              primary: false,
                              shrinkWrap: true,
                              controller: scrollController,
                              itemBuilder: (context, index) =>
                                  _buildItem(index, chatsList[index]));
                        } else {
                          return Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              Center(
                                child: Text(
                                  'Nenhuma discussão foi iniciada ainda, clique no botão acima para iniciar uma discussão.',
                                  style: AppText.headlineMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          );
                        }
                      } else {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryColor,
                            ),
                          );
                        }
                        return Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Center(
                              child: Text(
                                'Nenhuma discussão foi iniciada ainda, clique no botão acima para iniciar uma discussão.',
                                style: AppText.headlineMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        );
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildItem(int index, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      final chat = Chat.fromDocument(documentSnapshot);
      // final isMe = chatMessage.author == userId;
      return BookClubDiscussionWidget(
        chat: chat,
      );
    }
  }
}
