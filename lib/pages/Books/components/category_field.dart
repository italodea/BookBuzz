// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/general_components/books_list_view.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

import '../../../data/models/book.dart';

class CategoryField extends StatelessWidget {
  const CategoryField({super.key, required this.category, required this.books});
  final String category;
  final List<Book> books;

  void _openSingleBookPage(BuildContext context, Book book) {
    Navigator.pushNamed(context, AppRoute.SINGLEBOOK, arguments: book);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: AppText.displaySmall.merge(AppText.blackColor),
          ),
          SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 160,
            child: BooksListView(
              books_list: books,
              callback: (Book book) => _openSingleBookPage(context, book),
            ),
          ),
        ],
      ),
    );
  }
}
