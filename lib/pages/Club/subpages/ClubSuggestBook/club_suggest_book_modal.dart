// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/pages/Books/components/app_bar_search_field.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ClubSuggestBookModal extends StatefulWidget {
  const ClubSuggestBookModal(
      {super.key, required this.callback, required this.books_blacklist});
  final Function(Book) callback;
  final List<Book> books_blacklist;
  @override
  State<ClubSuggestBookModal> createState() => _ClubSuggestBookModalState();
}

class _ClubSuggestBookModalState extends State<ClubSuggestBookModal> {
  // List<Book> books_list = BooksList.list;
  TextEditingController search_controller = TextEditingController();

  void findBooks() {
    setState(() {
      // books_list = BooksList.searchBooks(title: text);
      // books_list = findDifference(books_list, widget.books_blacklist);
    });
  }

  List<Book> findDifference(List<Book> list1, List<Book> list2) {
    List<Book> difference = [];

    for (var livro1 in list1) {
      if (!list2.any((livro2) => livro2.title == livro1.title)) {
        difference.add(livro1);
      }
    }
    return difference;
  }

  @override
  Widget build(BuildContext context) {
    search_controller.addListener(findBooks);
    findBooks();
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        left: 8,
        right: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom + 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Sugira um livro",
            style: AppText.displayMedium.merge(AppText.primaryDarkColor),
          ),
          SizedBox(
            height: 15,
          ),
          SearchField(
            controller: search_controller,
          ),
          SizedBox(
            height: 35,
          ),
          // SizedBox(
          //   height: 160,
          //   child: books_list.isNotEmpty
          //       ? BooksListView(
          //           books_list: books_list,
          //           callback: (book) {
          //             widget.callback(book);
          //             Navigator.pop(context);
          //           },
          //         )
          //       : Center(
          //           child: Text("Livro não encontrado"),
          //         ),
          // ),
        ],
      ),
    );
  }
}
