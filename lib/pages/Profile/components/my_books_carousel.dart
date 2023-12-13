import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/data/models/user_book_situation.dart';
import 'package:bookbuzz/general_components/books_list_view.dart';
import 'package:bookbuzz/provider/profile_provider.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBooksCarousel extends StatelessWidget {
  MyBooksCarousel({required this.books});
  late final List<UserBookSituation> books;

  @override
  Widget build(BuildContext context) {
    return _buildCarousel(context, books);
  }

  Widget _buildCarousel(BuildContext context, List<UserBookSituation> books) {
    var validBooks =
        books.where((ubs) => ubs.book != null).map((ubs) => ubs.book!).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        // Adicione o boxShadow conforme necessário
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: BooksListView(
                callback: (Book book) => _openSingleBookPage(context, book),
                books_list: validBooks),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }

  void _openSingleBookPage(BuildContext context, Book book) {
    Navigator.pushNamed(context, AppRoute.SINGLEBOOK, arguments: book);
  }
}
