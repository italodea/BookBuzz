// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../data/models/book.dart';

class BooksListView extends StatefulWidget {
  const BooksListView({super.key, required this.books_list, this.callback});
  final List books_list;
  final Function(Book)? callback;

  @override
  State<BooksListView> createState() => _BooksListViewState();
}

class _BooksListViewState extends State<BooksListView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      addAutomaticKeepAlives: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.books_list.length,
      itemBuilder: (context, index) {
        Book book = widget.books_list[index];
        return InkWell(
          onTap: () {
            if (widget.callback != null) {
              widget.callback!(book);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/placeholder.png',
                image: book.coverImgUrl,
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
