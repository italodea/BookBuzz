// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/general_components/stat_card.dart';
import 'package:bookbuzz/general_components/my_vertical_divider.dart';
import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/provider/club_provider.dart';
import 'package:bookbuzz/services/user_book_situation_service.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum BookSituation {
  reading,
  read,
  wantToRead,
}

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  BookSituation bookSituation = BookSituation.reading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0,
                      spreadRadius: 1,
                      color: AppColors.secondaryColor,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder.png',
                    image: widget.user.urlPhoto,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          widget.user.readingBooks.isNotEmpty
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "📖 ${bookSituationToString(bookSituation)} ${widget.user.readingBooks[0].book?.title}",
                    style: AppText.labelMedium.merge(
                      AppText.blackColor,
                    ),
                  ),
                )
              : Container(),
          const SizedBox(
            height: 32,
          ),
          FutureBuilder(
            future: UserBookSituationService().getMyReadBooks(),
            builder: (context, snapshot) {
              // Valores iniciais (podem ser placeholders)
              String livros = "•";
              String clubes = "•";
              String seguidores = "•";

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Row(
                  children: [
                    StatCard(text: "Livros", value: livros),
                    const MyVerticalDivider(),
                    StatCard(text: "Clubes", value: clubes),
                    const MyVerticalDivider(),
                    StatCard(text: "Seguidores", value: seguidores),
                  ],
                );
              } else if (snapshot.hasData && !snapshot.hasError) {
                livros = snapshot.data?.length.toString() ?? "0";
              }

              // Exibe os StatCard com os valores atualizados
              return Row(
                children: [
                  StatCard(text: "Livros", value: livros),
                  const MyVerticalDivider(),
                  Consumer<ClubProvider>(
                    builder: (context, clubProvider, child) {
                      clubes = clubProvider.bookClub?.length.toString() ?? "0";
                      return StatCard(text: "Clubes", value: clubes);
                    },
                  ),
                  const MyVerticalDivider(),
                  StatCard(text: "Seguidores", value: seguidores),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  String bookSituationToString(BookSituation situation) {
    switch (situation) {
      case BookSituation.reading:
        return "Lendo";
      case BookSituation.read:
        return "Lido";
      case BookSituation.wantToRead:
        return "Quero ler";
      default:
        return "";
    }
  }
}
