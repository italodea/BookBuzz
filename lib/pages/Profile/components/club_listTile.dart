// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/data/models/book_club.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ClubListTile extends StatelessWidget {
  const ClubListTile(
      {super.key, required this.bookClub, this.isMember = false});

  final BookClub bookClub;
  final bool isMember;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.whiteColor,
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
            image: bookClub.coverImage,
            fit: BoxFit.cover,
            width: 40,
            height: 40,
          ),
        ),
      ),
      title: Text(
        bookClub.name,
        overflow: TextOverflow.ellipsis,
        style: AppText.titleMedium.merge(AppText.blackColor),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.pushNamed(context, AppRoute.CLUBPAGE,
            arguments: {'bookClub': bookClub, 'isMember': isMember});
      },
    );
  }
}
