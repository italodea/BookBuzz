// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/data/models/message.dart';
import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/pages/MessagesList/components/message_timestamp_widget.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {
  const MessageBubbleWidget({
    Key? key,
    required this.chatMessage,
    required this.isMe,
    required this.user,
  }) : super(key: key);

  final Message chatMessage;
  final bool isMe;

  final User user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: isMe
                  ? const EdgeInsets.only(right: 10, top: 10)
                  : const EdgeInsets.only(left: 10, top: 20),
              width: 250,
              decoration: BoxDecoration(
                color:
                    isMe ? AppColors.secondaryColor : AppColors.foregroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: AppText.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  chatMessage.imagePath != "" &&
                          chatMessage.imagePath != "loading"
                      ? // ? Image.network(
                      //     chatMessage.imagePath,
                      //   )
                      CachedNetworkImage(
                          imageUrl: chatMessage.imagePath,
                          placeholder: (context, url) => SizedBox(
                            height: 250,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : Container(),
                  Text(
                    chatMessage.message,
                    style: AppText.bodyMedium,
                  ),
                  MessageTimestampWidget(
                    timestamp: chatMessage.timestamp,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
