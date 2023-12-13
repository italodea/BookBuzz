// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:bookbuzz/data/models/chat.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/services/profile_service.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookClubDiscussionWidget extends StatelessWidget {
  final Chat chat;

  final ProfileService profileService = ProfileService();

  BookClubDiscussionWidget({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(
        vertical: 9,
      ),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        borderRadius: BorderRadius.circular(7),
        color: AppColors.whiteColor,
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoute.MESSAGES, arguments: chat);
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.book,
                                  color: AppColors
                                      .primaryColor), // Ícone para representar o livro
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  chat.caption != ""
                                      ? "Capítulo ${chat.caption}"
                                      : "Sem capítulo",
                                  style: AppText.displaySmall,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        chat.page != 0
                            ? Row(
                                children: [
                                  Icon(Icons.menu_book_sharp,
                                      color: AppColors
                                          .primaryColor), // Ícone para representar a página
                                  SizedBox(width: 8),
                                  Text(
                                    "${chat.caption != '' && chat.page != 0 ? '-' : ''} Pag. ${chat.page}",
                                    style: AppText.bodyLarge,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.person,
                            color: AppColors
                                .primaryColor), // Ícone para representar o autor
                        SizedBox(width: 8),

                        Text(
                          "Aberto em: ${DateFormat('dd/MM/yyyy').format(chat.timestamp.toDate())}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
