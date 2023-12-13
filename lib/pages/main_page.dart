// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/pages/Books/books_page.dart';
import 'package:bookbuzz/pages/ClubFeed/club_feed_page.dart';
import 'package:bookbuzz/pages/Profile/profile_page.dart';
import 'package:bookbuzz/provider/club_provider.dart';
import 'package:bookbuzz/provider/profile_provider.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;

  List<Widget> screens = [
    ClubFeedPage(),
    BooksPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    AuthService().isValidSession().then((value) {
      if (!value) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
    Provider.of<ProfileProvider>(context, listen: false).getMyProfile();
    Provider.of<ClubProvider>(context, listen: false).getClubsWhereImMemberSimple();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: AppColors.backgroundColor,
        ),
        body: IndexedStack(
          index: _currentPageIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Cor da sombra
                spreadRadius: 2, // Raio de espalhamento
                blurRadius: 4, // Raio de desfoque
                offset: Offset(0, -1), // Deslocamento da sombra
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _currentPageIndex,
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: AppColors.blackColor,
            unselectedItemColor: AppColors.blackColor.withOpacity(0.7),
            onTap: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.feed_outlined),
                activeIcon: Icon(Icons.feed),
                label: 'Clubes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                activeIcon: Icon(Icons.book),
                label: 'Livros',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                activeIcon: Icon(Icons.person_2),
                label: 'Perfil',
              ),
            ],
          ),
        ));
  }
}
