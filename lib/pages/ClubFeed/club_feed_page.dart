// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_private_types_in_public_api

import 'package:bookbuzz/pages/ClubCreate/club_create_page.dart';
import 'package:bookbuzz/pages/ClubFeed/components/club_list_view.dart';
import 'package:bookbuzz/provider/club_provider.dart';
import 'package:bookbuzz/services/book_club_service.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubFeedPage extends StatefulWidget {
  const ClubFeedPage({Key? key}) : super(key: key);

  @override
  _ClubFeedPageState createState() => _ClubFeedPageState();
}

class _ClubFeedPageState extends State<ClubFeedPage> {
  @override
  void initState() {
    super.initState();
    // clubsWhereImMember_list = ClubsList.getClubsWhereImMember(users_list[7]);
    // clubsWhereImNotMember_list =
    // ClubsList.getuClubsWhereImNotMember(users_list[7]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          height: double.infinity,
          child: Image.asset(
            'assets/logo/logo-simples.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () async {
              bool? clubCreated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClubCreatePage(),
                  ));
              if (clubCreated == true) {
                // Recarregue os dados ou faça o que for necessário após a criação do clube.
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
        title: Text('Clubes do livro'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Clubes que você participa",
                  style: AppText.bodyLarge,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    FutureBuilder(
                      future: Provider.of<ClubProvider>(context)
                          .getClubsWhereImMember(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.secondaryColor,
                              ),
                            );
                          case ConnectionState.active:
                          default:
                            if (snapshot.hasData) {
                              return Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(9),
                                    boxShadow: AppColors.shadow,
                                  ),
                                  child: ClubListView(
                                    clubList: snapshot.data,
                                    isMember: true,
                                  ));
                            } else {
                              return Center(
                                child:
                                    Text("Você não participa de nenhum clube"),
                              );
                            }
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  "Clubes que você pode gostar",
                  style: AppText.bodyLarge,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 12,
                ),
                Column(children: [
                  FutureBuilder(
                    future: BookClubService().getClubsWhereImNotMember(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryColor,
                            ),
                          );
                        case ConnectionState.active:
                        default:
                          return Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: AppColors.shadow,
                              ),
                              child: ClubListView(clubList: snapshot.data));
                      }
                    },
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
