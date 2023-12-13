// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ClubReadingNow extends StatelessWidget {
  const ClubReadingNow({super.key, required this.book});

  final Book book;
  @override
  Widget build(BuildContext context) {
    if (book.title == "") {
      return SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/animations/animation3.gif',
              width: 250,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Este clube não está lendo nenhum livro no momento",
                style: AppText.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                FadeInImage.assetNetwork(
                  width: 250,
                  placeholder: 'assets/images/placeholder.png',
                  image: book.coverImgUrl,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: AppText.displayMedium,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: book.author.length,
                      itemBuilder: (context, index) {
                        return Text(
                          book.author[index],
                          style: AppText.bodySmall,
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      book.description,
                      style: AppText.bodySmall,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
