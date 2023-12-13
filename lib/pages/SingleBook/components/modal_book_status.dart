// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/data/models/user_book_situation.dart';
import 'package:bookbuzz/services/user_book_situation_service.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/store/user_book_situation_store.dart';

class ModalBookStatus extends StatefulWidget {
  const ModalBookStatus({super.key, this.bookStatus, required this.bookId});

  final UserBookSituation? bookStatus;
  final String bookId;
  @override
  State<ModalBookStatus> createState() => _ModalBookStatusState();
}

class _ModalBookStatusState extends State<ModalBookStatus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12,
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 5),
            child: Text(
              "Status do livro",
              style: AppText.displayMedium,
            ),
          ),
          Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.bookmark_border),
                title: Text(
                  'Quero ler',
                  style: widget.bookStatus?.bookStatus.id == 1
                      ? AppText.bodyLarge
                          .merge(TextStyle(fontWeight: FontWeight.bold))
                      : AppText.bodyLarge,
                ),
                onTap: () {
                  Provider.of<UserBookSituationStore>(context, listen: false)
                      .setUserBookSituation(1, widget.bookId);

                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.library_books),
                title: Text(
                  'Estou lendo',
                  style: widget.bookStatus?.bookStatus.id == 2
                      ? AppText.bodyLarge
                          .merge(TextStyle(fontWeight: FontWeight.bold))
                      : AppText.bodyLarge,
                ),
                onTap: () {
                  Provider.of<UserBookSituationStore>(context, listen: false)
                      .setUserBookSituation(2, widget.bookId);
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.check),
                title: Text(
                  "Já li",
                  style: widget.bookStatus?.bookStatus.id == 3
                      ? AppText.bodyLarge
                          .merge(TextStyle(fontWeight: FontWeight.bold))
                      : AppText.bodyLarge,
                ),
                onTap: () async {
                  if (widget.bookStatus != null) {
                    await UserBookSituationService().updateBookSituation(
                        widget.bookStatus?.id ?? 0,
                        widget.bookStatus?.bookStatus.id != 3 ? 3 : 0);
                  } else {
                    await UserBookSituationService().create(widget.bookId, 3);
                  }
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel),
                title: Text(
                  "Abandonei",
                  style: widget.bookStatus?.bookStatus.id == 4
                      ? AppText.bodyLarge
                          .merge(TextStyle(fontWeight: FontWeight.bold))
                      : AppText.bodyLarge,
                ),
                onTap: () async {
                  if (widget.bookStatus != null) {
                    await UserBookSituationService().updateBookSituation(
                        widget.bookStatus?.id ?? 0,
                        widget.bookStatus?.bookStatus.id != 4 ? 4 : 0);
                  } else {
                    await UserBookSituationService().create(widget.bookId, 4);
                  }
                  if (mounted) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
