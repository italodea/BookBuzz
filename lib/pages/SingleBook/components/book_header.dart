// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:bookbuzz/data/models/user_book_situation.dart';
import 'package:bookbuzz/general_components/my_button.dart';
import 'package:bookbuzz/pages/SingleBook/components/modal_book_status.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../data/models/book.dart';
import '../../../data/store/user_book_situation_store.dart';
import '../../../styles/app_text.dart';

class BookHeader extends StatefulWidget {
  const BookHeader({super.key, required this.book});

  final Book book;

  @override
  State<BookHeader> createState() => _BookHeaderState();
}

class _BookHeaderState extends State<BookHeader> {
  void _showModalOptionsBookStatus(
      BuildContext context, UserBookSituation? value, String bookId) {
    showModalBottomSheet(
      backgroundColor: AppColors.whiteColor,
      barrierColor: AppColors.blackColor.withOpacity(0.4),
      context: context,
      builder: (context) {
        return ModalBookStatus(
          bookStatus: value,
          bookId: bookId,
        );
      },
    );
  }

  void _shareBook() async {
    // Baixar a imagem do livro
    final response = await http.get(Uri.parse(widget.book.thumbImgUrl));
    final Uint8List imageData = response.bodyBytes;

    // Salvar a imagem do livro em um arquivo temporário
    final tempDir = await getTemporaryDirectory();
    final tempFile =
        await File('${tempDir.path}/book_cover.png').writeAsBytes(imageData);

    // Compartilhar texto e imagem
    await Share.shareXFiles(
      [XFile('${tempDir.path}/book_cover.png')],
      text: '${widget.book.title.toUpperCase()}\n'
          'Autor(es): ${widget.book.author.join(", ")}\n'
          'Páginas: ${widget.book.pages}\n'
          'Link para abrir o aplicativo: [insira o link aqui]', // Substitua [insira o link aqui] pelo link correto
      subject: widget.book.title,
    );

    // Remover o arquivo temporário após o compartilhamento
    tempFile.delete();
  }

  Icon bookMarkBorder = Icon(
    Icons.bookmark_border_rounded,
    size: 25,
    color: AppColors.blackColor,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.png',
              image: widget.book.thumbImgUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              widget.book.title.toUpperCase(),
              style: AppText.displaySmall.merge(AppText.blackColor),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: widget.book.author.length,
              itemBuilder: (context, index) {
                return Text(
                  widget.book.author[index],
                  style: AppText.titleMedium,
                  textAlign: TextAlign.center,
                );
              },
            ),
            Text(
              '${widget.book.pages} páginas',
              style: AppText.labelMedium,
            ),
            SizedBox(height: 30),
            RatingBar.builder(
                initialRating: widget.book.rating,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: AppColors.secondaryColor,
                    ),
                ignoreGestures: true, // não alterar o ratings
                onRatingUpdate: (rating) {} // não fazer nada
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.book.rating}',
                  style: AppText.headlineMedium,
                ),
                Text(
                  ' (${widget.book.ratingCount} avaliações)',
                  style: AppText.labelMedium,
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
        Column(
          children: [
            Divider(
              color: AppColors.blackColor,
              thickness: 1.0,
              height: 0.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: Row(
                children: [
                  FutureBuilder(
                      future: Provider.of<UserBookSituationStore>(context,
                              listen: false)
                          .getBookSituation(widget.book.id),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Expanded(
                              child: MyButton(
                                  icon: Icon(
                                    Icons.bookmarks_outlined,
                                    size: 25,
                                    color: AppColors.blackColor,
                                  ),
                                  text: "Status",
                                  function: () {
                                    // _showModalOptions(context);
                                  }),
                            );
                          default:
                            if (snapshot.hasError) {
                              return Text("Erro ao carregar");
                            } else {
                              return Expanded(
                                child: MyButton(
                                    icon: Icon(
                                      Icons.bookmarks_outlined,
                                      size: 25,
                                      color: AppColors.blackColor,
                                    ),
                                    text: "Status",
                                    function: () {
                                      Provider.of<UserBookSituationStore>(
                                              context,
                                              listen: false)
                                          .setBookSituation(snapshot.data);
                                      _showModalOptionsBookStatus(
                                          context,
                                          Provider.of<UserBookSituationStore>(
                                                  context,
                                                  listen: false)
                                              .getUserBookSituation,
                                          widget.book.id);
                                    }),
                              );
                            }
                        }
                      }),
                  Expanded(
                    child: MyButton(
                        icon: Icon(
                          Icons.share,
                          size: 25,
                          color: AppColors.blackColor,
                        ),
                        text: "Compartilhar",
                        function: _shareBook),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
