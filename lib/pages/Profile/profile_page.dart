// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/data/store/books_repository.dart';
import 'package:bookbuzz/pages/Profile/components/club_listTileView.dart';
import 'package:bookbuzz/pages/Profile/components/my_books_carousel.dart';
import 'package:bookbuzz/pages/Profile/components/profile_header.dart';
import 'package:bookbuzz/provider/club_provider.dart';
import 'package:bookbuzz/provider/profile_provider.dart';
import 'package:bookbuzz/services/profile_service.dart';
import 'package:bookbuzz/static_db/users_list.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:bookbuzz/pages/Profile/components/profile_drawer.dart';
import 'package:provider/provider.dart';

import '../../data/models/book.dart';
import '../../data/models/user.dart';
import '../../routes/app_routes.dart';
import '../../services/book_club_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List usersList = UsersList.list;
  User? user;
  void _openSingleBookPage(BuildContext context, Book book) {
    Navigator.pushNamed(context, AppRoute.SINGLEBOOK, arguments: book);
  }

  @override
  void initState() {
    super.initState();
    // Carregar os livros quando a página é iniciada
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    profileProvider.getMyReadBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ProfileProvider>(
          builder: (context, profileProvider, _) {
            return Text(profileProvider.userProfile?.name ?? "Carregando...");
          },
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // profileFuture.userProfile == null
              //     ? Center(
              //         child: CircularProgressIndicator(
              //           color: AppColors.primaryColor,
              //         ),
              //       )
              //     : ProfileHeader(
              //         user: profileFuture.userProfile!,
              //       ),
              FutureBuilder(
                future: ProfileService().getMyProfile(),
                builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                    default:
                      return ProfileHeader(
                        user: snapshot.data!,
                      );
                  }
                },
              ),

              SizedBox(
                height: 10,
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, size: 10),
                title: Text(
                  'Meus livros',
                  style: AppText.titleSmall.merge(AppText.blackColor),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.MYBOOKS);
                },
              ),
              Consumer<ProfileProvider>(
                builder: (context, profileProvider, _) {
                  if (profileProvider.myReadBooks == null) {
                    return Column(
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.secondaryColor,
                        ),
                      ],
                    );
                  } else if (profileProvider.myReadBooks!.isEmpty) {
                    return Text('Nenhum livro encontrado');
                  } else {
                    return MyBooksCarousel(
                      books: profileProvider.myReadBooks!,
                    );
                  }
                },
              ),

              // SizedBox(
              //   height: 150,
              //   child: BooksListView(
              //     books_list: books,
              //     callback: (Book book) =>
              //         _openSingleBookPage(context, book),
              //   ),
              // ),
              ListTile(
                title: Text(
                  'Meus clubes',
                  style: AppText.titleSmall.merge(AppText.blackColor),
                ),
              ),
              // Provider.of<ClubProvider>(context).bookClub == null
              //     ? Center(
              //         child: Text("Você não participa de nenhum clube ainda"),
              //       )
              //     : ClubListTileView(
              //         clubList: Provider.of<ClubProvider>(context).bookClub),
              FutureBuilder(
                future: BookClubService().getClubsWhereImMember(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.secondaryColor,
                        ),
                      );
                    case ConnectionState.done:
                    default:
                      if (snapshot.hasData) {
                        return ClubListTileView(
                          clubList: snapshot.data,
                          isMember: true,
                        );
                      } else {
                        return Center(
                          child:
                              Text("Você não participa de nenhum clube ainda"),
                        );
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      endDrawer: ProfileDrawer(),
    );
  }
}
