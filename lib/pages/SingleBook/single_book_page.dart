// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/general_components/my_expanded_card.dart';
import 'package:bookbuzz/pages/SingleBook/components/book_header.dart';
import 'package:bookbuzz/pages/SingleBook/components/books_comments_area.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';
import '../../data/models/book.dart';

class SingleBookPage extends StatefulWidget {
  const SingleBookPage({
    super.key,
    this.book,
  });

  final Book? book;

  @override
  State<SingleBookPage> createState() => _SingleBookPageState();
}

class _SingleBookPageState extends State<SingleBookPage> {
  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined, // Ícone de seta padrão
            color: AppColors.blackColor, // Cor da seta
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          children: [
            BookHeader(book: book),
            SizedBox(height: 20),
            MyExpandedCard(
              title: 'Descrição',
              description: book.description,
            ),
            SizedBox(height: 20),
            BooksCommentsArea(id: book.id),
            // BookSimilar(book: book),
            SizedBox(height: 40),
          ],
        ),
      )),
    );
  }
}
