import 'package:bookbuzz/data/models/book.dart';
import 'package:bookbuzz/pages/Profile/components/profile_header.dart';
import 'package:bookbuzz/provider/profile_provider.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_colors.dart';
// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBooksPage extends StatefulWidget {
  const MyBooksPage({super.key});

  @override
  State<MyBooksPage> createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProfileProvider>(context, listen: false).getMyReadBooks();

    return Scaffold(
        appBar: AppBar(
          title: Text('Meus Livros'),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                // Verificando se myReadBooks não é nulo e tem itens
                if (profileProvider.myReadBooks != null &&
                    profileProvider.myReadBooks!.isNotEmpty) {
                  return Column(
                    children: [
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Text("Meus livros",
                              style:
                                  AppText.bodyMedium.merge(AppText.blackColor)),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Usando map para criar uma lista de widgets bookCard
                      ...profileProvider.myReadBooks!.map((userBookSituation) {
                        return bookCard(userBookSituation.book as Book?);
                      }).toList(),
                    ],
                  );
                } else if (profileProvider.myReadBooks == null) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Nenhum livro encontrado"),
                  );
                }
              },
            ),
          ),
        ));

    // body: SingleChildScrollView(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    //     child: Column(
    //       children: [
    //         SizedBox(
    //           height: 40,
    //         ),
    //         Row(
    //           children: [
    //             Text("Lendo",
    //                 style: AppText.bodyMedium.merge(AppText.blackColor)),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 10,
    //         ),
    //         // TRANSFORMAR EM COMPONENTE E FAZER 1 MAP
    //         InkWell(
    //           onTap: () {},
    //           child: Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Column(
    //                 children: [
    //                   ClipRRect(
    //                     borderRadius: BorderRadius.circular(9),
    //                     child: FadeInImage.assetNetwork(
    //                       placeholder: 'assets/images/placeholder.png',
    //                       image:
    //                           'https://m.media-amazon.com/images/I/61fHJlWilpL._SY466_.jpg',
    //                       fit: BoxFit.cover,
    //                       height: 100,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text('Nome do Livro',
    //                           style: AppText.titleMedium
    //                               .merge(AppText.blackColor)),
    //                       Text('Nome do Autor',
    //                           style: AppText.bodySmall
    //                               .merge(AppText.blackColor)),
    //                     ]),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ));
  }

  Widget bookCard(Book? book) {
    if (book == null) {
      return Container();
    }
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.SINGLEBOOK, arguments: book);
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.png',
                  image: book.coverImgUrl,
                  fit: BoxFit.cover,
                  height: 100,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.title,
                          style: AppText.titleMedium.merge(AppText.blackColor),
                          overflow: TextOverflow
                              .ellipsis, // Adiciona overflow para texto
                        ),
                        Text(
                          book.author[0] ?? '',
                          style: AppText.bodySmall.merge(AppText.blackColor),
                          overflow: TextOverflow
                              .ellipsis, // Adiciona overflow para texto
                        )
                      ]),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  String bookSituationToString(BookSituation situation) {
    switch (situation) {
      case BookSituation.reading:
        return "Lendo";
      case BookSituation.read:
        return "Lido";
      case BookSituation.wantToRead:
        return "Quero ler";
      default:
        return "";
    }
  }
}
