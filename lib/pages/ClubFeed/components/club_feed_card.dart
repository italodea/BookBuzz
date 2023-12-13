// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/data/models/book_club.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ClubFeedCard extends StatelessWidget {
  const ClubFeedCard(
      {super.key, required this.bookClub, this.isMember = false});

  final BookClub bookClub;
  final bool isMember;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.CLUBPAGE, arguments: {
          'bookClub': bookClub,
          'isMember': isMember,
        });
      },
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 13),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0,
                        spreadRadius: 2,
                        color: AppColors.secondaryColor,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder.png',
                      image: bookClub.coverImage,
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        bookClub.name,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.titleLarge.merge(AppText.blackColor),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        bookClub.description,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.bodyMedium.merge(AppText.blackColor),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: AppColors.secondaryColor,
                      size: 22,
                    ),
                    Text(
                      " ${bookClub.membersTotal} membro${bookClub.membersTotal != 1 ? 's' : ''}",
                      style: AppText.bodyLarge.merge(
                        AppText.blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.menu_book_sharp,
                      color: AppColors.secondaryColor,
                      size: 22,
                    ),
                    Text(
                      " ${bookClub.votations.length} livro${bookClub.votations.length != 1 ? 's' : ''} lido${bookClub.votations.length != 1 ? 's' : ''}",
                      style: AppText.bodyLarge,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
