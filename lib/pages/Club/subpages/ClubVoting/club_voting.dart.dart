// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:bookbuzz/data/models/book_club.dart';
import 'package:bookbuzz/data/models/suggested_book.dart';
import 'package:bookbuzz/general_components/my_radio.dart';
import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/static_db/users_list.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ClubVoting extends StatefulWidget {
  const ClubVoting({Key? key, required this.club}) : super(key: key);

  final BookClub club;

  @override
  _ClubVotingState createState() => _ClubVotingState();
}

class _ClubVotingState extends State<ClubVoting> {
  // List<Book> booksList = BooksList.list;
  // List<SuggestedBook> suggestedBooks = SuggestedBookList.list;
  List<User> users = UsersList.list;

  void openSuggestBookModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container();
        // return ClubSuggestBookModal(
        //   books_blacklist: suggestedBooks,
        //   callback: (bookReturned) {
        //     setState(() {
        //       suggestedBooks.add(
        //         SuggestedBook(
        //           bookReturned.category,
        //           bookReturned.title,
        //           bookReturned.author,
        //           bookReturned.description,
        //           bookReturned.rating,
        //           bookReturned.ratingCount,
        //           bookReturned.pages,
        //           bookReturned.coverImgUrl,
        //           [],
        //           users[7],
        //         ),
        //       );
        //       orderBooks();
        //     });
        //   },
        // );
      },
    );
  }

  void orderBooks() {
    // suggestedBooks.sort((a, b) => b.votes.length.compareTo(a.votes.length));
  }

  @override
  void initState() {
    super.initState();
    orderBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: 10,
          primary: true,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              height: 130,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://m.media-amazon.com/images/I/71ZLavBjpRL._AC_UF1000,1000_QL80_.jpg',
                          height: 100,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "O senhor dos anéis",
                          style: AppText.headlineMedium,
                        ),
                        Text(
                          "J.R.R. Tolkien - 121 páginas",
                        ),
                        Text("Sugerido por: Maycon"),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [MyRadio(marked: true)],
                  ),
                ],
              ),
              // child: _buildBookItem(suggestedBooks[index]),
            );
          }),
      // floatingActionButton: suggestedBooks
      //         .where((element) => element.suggestedBy == users[7])
      //         .toList()
      //         .isEmpty
      //     ? FloatingActionButton(
      //         onPressed: () {
      //           openSuggestBookModal();
      //         },
      //         child: Icon(Icons.add),
      //         backgroundColor: AppColors.secondaryColor,
      //       )
      //     : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildBookList() {
    return ListView.builder(
      itemCount: 0,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
              height: 100,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
              // child: _buildBookItem(book),
            ),
            // (index != suggestedBooks.length - 1)
            //     ? MyHorizontalDivider(
            //         width: MediaQuery.of(context).size.width * 0.89,
            //       )
            //     : Container(),
          ],
        );
      },
    );
  }

  Widget _buildBookItem(SuggestedBook book) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInImage.assetNetwork(
          placeholder: 'assets/images/placeholder.png',
          image: book.coverImgUrl,
          height: 70,
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: AppText.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                // book.author.toString(),
                "trocar nome do autor aqui",
                style: AppText.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Sugerido por: ${book.suggestedBy.name}",
                style: AppText.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${book.votes.length} votos",
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  _toggleVote(book);
                },
                child: MyRadio(
                  marked: book.votes.contains(users[7]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _toggleVote(SuggestedBook book) {
    setState(() {
      if (book.votes.contains(users[7])) {
        book.votes.remove(users[7]);
      } else {
        book.votes.add(users[7]);
      }
      orderBooks();
    });
  }
}
