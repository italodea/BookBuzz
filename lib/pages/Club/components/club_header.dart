// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/data/models/book_club.dart';
import 'package:bookbuzz/data/repositories/book_club_api.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ClubHeader extends StatelessWidget {
  const ClubHeader({super.key, required this.bookClub});

  final BookClub bookClub;

  void _deleteClub(BuildContext context) async {
    await BookClubApi.deleteClub(bookClub.id);
    Navigator.of(context)
        .popUntil((route) => route.isFirst); // Volta para a primeira rota
  }

  DropdownButton<String> _buildDropdownButton(BuildContext context) {
    return DropdownButton<String>(
      icon: Icon(Icons.more_vert, color: AppColors.whiteColor),
      underline: SizedBox.shrink(), // Remove a underline padrão
      items: [
        DropdownMenuItem(
          value: 'delete',
          child: Text('Excluir Clube'),
        ),
      ],
      onChanged: (value) {
        if (value == 'delete') {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Confirmar exclusão'),
              content: Text('Tem certeza de que deseja excluir este clube?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: () {
                    _deleteClub(context);
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoute.HOME, (route) => false);
                  },
                  child: Text('Excluir'),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      height: 310,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: AppColors.primaryColor,
        image: DecorationImage(
          image: NetworkImage(
            bookClub.coverImage,
          ),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.whiteColor,
                  ),
                ),
                _buildDropdownButton(context)
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  bookClub.name,
                  style: AppText.displayLarge
                      .merge(
                        AppText.whiteColor,
                      )
                      .merge(
                        AppText.shadow,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          bookClub.currentBook.id != ""
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    bookClub.currentBook.title,
                    style: AppText.labelSmall.merge(
                      AppText.blackColor,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
