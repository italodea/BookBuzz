// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/data/models/message.dart';
import 'package:bookbuzz/pages/MessagesList/components/message_timestamp_widget.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MessageBubbleWidget extends StatelessWidget {
  const MessageBubbleWidget({
    Key? key,
    required this.chatMessage,
    required this.isMe,
  }) : super(key: key);

  final Message chatMessage;
  final bool isMe;

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
                  ? const EdgeInsets.only(right: 10)
                  : const EdgeInsets.only(left: 10),
              width: 200,
              decoration: BoxDecoration(
                color:
                    isMe ? AppColors.secondaryColor : AppColors.foregroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chatMessage.author.toString(),
                    style: TextStyle(fontSize: 13, color: AppColors.blackColor),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    chatMessage.message,
                    style: TextStyle(fontSize: 16, color: AppColors.blackColor),
                  ),
                ],
              ),
            ),
          ],
        ),
        MessageTimestampWidget(timestamp: chatMessage.timestamp),
      ],
    );
  }
}
