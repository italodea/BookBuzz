// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:bookbuzz/pages/MessagesList/messages_list.dart';
import 'package:bookbuzz/pages/ClubCreate/club_create_page.dart';
import 'package:bookbuzz/pages/Login/sign_up_page.dart';
import 'package:bookbuzz/pages/Profile/my_books_page.dart';
import 'package:bookbuzz/test_page.dart';
import 'package:bookbuzz/pages/Club/club_page.dart';
import 'package:bookbuzz/pages/ClubFeed/club_feed_page.dart';
import 'package:bookbuzz/pages/Login/login_page.dart';
import 'package:bookbuzz/pages/Profile/profile_page.dart';
import 'package:bookbuzz/pages/SingleBook/single_book_page.dart';
import 'package:bookbuzz/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:bookbuzz/pages/Login/welcome_page.dart';

/// A class that contains the routes for the BookBuzz app.
class AppRoute {
  static const HOME = "/home";
  static const WELCOME = '/welcome';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const CLUB = "/club";
  static const CREATE_CLUB = "/createClub";
  static const PROFILE = "/profile";
  static const MYBOOKS = "/myBooks";
  static const TEST = "/test";
  static const SINGLEBOOK = "/singleBook/:book";
  static const CLUBPAGE = '/club/page/:arguments';
  static const MESSAGES = '/club/messages/:chat';

  /// Returns a map of routes and their corresponding widgets.
  static Map<String, Widget Function(dynamic context)> getRoutes() {
    return {
      WELCOME: (context) => WelcomePage(),
      LOGIN: (context) => LoginPage(),
      SIGNUP: (context) => SignUpPage(),
      HOME: (context) => MainPage(),
      SINGLEBOOK: (context) => SingleBookPage(),
      CLUB: (context) => ClubFeedPage(),
      CREATE_CLUB: (context) => ClubCreatePage(),
      PROFILE: (context) => ProfilePage(),
      MYBOOKS: (context) => MyBooksPage(),
      TEST: (context) => TestPage(),
      CLUBPAGE: (context) => ClubPage(),
      MESSAGES: (context) => MessagesList(),
    };
  }
}
