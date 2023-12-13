// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:bookbuzz/data/models/book_club.dart';
import 'package:bookbuzz/pages/Club/subpages/ClubChatsList/club_chats_list.dart';
import 'package:bookbuzz/pages/Club/components/club_header.dart';
import 'package:bookbuzz/pages/Club/subpages/ClubMember/club_member.dart';
import 'package:bookbuzz/pages/Club/subpages/ClubReadingNow/club_reading_now.dart';
import 'package:bookbuzz/pages/Club/subpages/ClubVoting/club_voting.dart.dart';
import 'package:bookbuzz/pages/Club/components/my_sliver_appbar.dart';
import 'package:bookbuzz/services/book_club_service.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({Key? key, this.arguments});

  final Map<String, dynamic>? arguments;
  @override
  State<ClubPage> createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  final bodyGlobalKey = GlobalKey();
  late BookClub bookClub;
  late bool isMember;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookClub = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['bookClub'] as BookClub;
    final isMember = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['isMember'] as bool;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoute.HOME, (Route<dynamic> route) => false),
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      body: DefaultTabController(
        length: isMember ? 4 : 2,
        child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  centerTitle: false,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  excludeHeaderSemantics: true,
                  forceElevated: false,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(0),
                    background: ClubHeader(bookClub: bookClub),
                  ),
                  toolbarHeight: 0,
                ),
                ClubHeaderTabBar(isMember: isMember)
              ];
            },
            body: FutureBuilder(
              future: BookClubService().getById(bookClub.id),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.secondaryColor,),
                    );
                  default:
                    if (snapshot.hasData && !snapshot.hasError) {
                      return Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: isMember
                            ? TabBarView(
                                children: <Widget>[
                                  ClubReadingNow(
                                    book: bookClub.currentBook,
                                  ),
                                  ClubVoting(club: bookClub),
                                  ClubChatsList(
                                    club: bookClub,
                                  ),
                                  ClubMember(
                                    members: bookClub.participants,
                                  ),
                                ],
                              )
                            : TabBarView(
                                children: <Widget>[
                                  ClubReadingNow(
                                    book: bookClub.currentBook,
                                  ),
                                  ClubMember(
                                    members: bookClub.participants,
                                  ),
                                ],
                              ),
                      );
                    }
                    return Container();
                }
              },
            )),
      ),
    );
  }
}
