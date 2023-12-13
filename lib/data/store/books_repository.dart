// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/book.dart';
import '../repositories/google_books_api.dart';

class BooksRepository extends ChangeNotifier {
  List<Book> _books = [];
  String _busca = "";

  UnmodifiableListView<Book> get books => UnmodifiableListView(_books);
  String get busca => _busca;

  Future<void> findBooksByTitle(
      Timer timer, TextEditingController controller) async {
    if (timer.isActive) {
      timer.cancel();
    }
    _books.clear();
    timer = Timer(Duration(milliseconds: 500), () async {
      try {
        _busca = controller.text;
        _books = await GoogleBooksApi.findAll(title: busca);
        notifyListeners();
      } catch (error) {
        print("Error fetching books: $error");
      }
    });
  }

  Future<List<Book>> findBooksByGenre(String genre) async {
    // try {
    return await GoogleBooksApi.findAll(genre: genre);
    // } catch (e) {
    // print("books: findByGenre -> $e");
    // return [];
    // }
  }
}
