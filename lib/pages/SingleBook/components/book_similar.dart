// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/general_components/books_list_view.dart';
import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';

class BookSimilar extends StatefulWidget {
  const BookSimilar({super.key, required this.book});

  final Book book;

  @override
  State<BookSimilar> createState() => _BookSimilarState();
}

class _BookSimilarState extends State<BookSimilar> {
  List<dynamic> livros = [];

  void _openSingleBookPage(BuildContext context, Book book) {
    Navigator.pushNamed(context, AppRoute.SINGLEBOOK, arguments: book);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppColors.shadow,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            child: Row(
              children: [
                Text(
                  "Similares",
                  style: AppText.displaySmall.merge(AppText.blackColor),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 150,
            child: BooksListView(
              callback: (Book book) => _openSingleBookPage(context, book),
              books_list: livros,
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
