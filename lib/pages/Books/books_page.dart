// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:bookbuzz/pages/Books/components/category_field.dart';
import 'package:bookbuzz/pages/Books/components/loading_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/book.dart';
import '../../data/store/books_repository.dart';
import '../../routes/app_routes.dart';
import '../../static_db/categories.dart';
import 'components/app_bar_search_field.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final TextEditingController _controller = TextEditingController();

  final Timer _timer = Timer(Duration(milliseconds: 500), () {});

  @override
  void dispose() {
    _controller.dispose();
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _openSingleBookPage(BuildContext context, Book book) {
    Navigator.pushNamed(context, AppRoute.SINGLEBOOK, arguments: book);
  }

  @override
  Widget build(BuildContext context) {
    List<Book> books = Provider.of<BooksRepository>(context).books;
    String busca = Provider.of<BooksRepository>(context).busca;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: false,
            toolbarHeight: 70,
            flexibleSpace: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SearchField(
                  onChanged: (String opa) {
                    Provider.of<BooksRepository>(context, listen: false)
                        .findBooksByTitle(_timer, _controller);
                  },
                  controller: _controller,
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 20),
                  busca.isEmpty
                      ? ListView.builder(
                          primary: false,
                          itemCount: Categories.categoriesList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: Provider.of<BooksRepository>(context,
                                      listen: false)
                                  .findBooksByGenre(
                                      Categories.categoriesList[index]),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                  case ConnectionState.none:
                                    return LoadingCategories(
                                      category:
                                          Categories.categoriesList[index],
                                    );
                                  case ConnectionState.done:
                                  default:
                                    if (snapshot.hasData) {
                                      return CategoryField(
                                        category: Categories
                                            .categoriesMap.entries
                                            .firstWhere((element) =>
                                                element.key ==
                                                Categories
                                                    .categoriesList[index])
                                            .value,
                                        books: snapshot.data,
                                      );
                                    } else {
                                      return Center(
                                        child: Text(snapshot.error.toString()),
                                      );
                                    }
                                }
                              },
                            );
                          },
                        )
                      : (books.isNotEmpty
                          ? GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 3,
                                mainAxisSpacing: 30,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: books.length,
                              itemBuilder: (context, index) {
                                Book book = books[index];
                                return InkWell(
                                  onTap: () {
                                    _openSingleBookPage(context, book);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 15.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/placeholder.png',
                                        image: book.coverImgUrl,
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 200,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Text("Livro não encontrado"),
                            )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
