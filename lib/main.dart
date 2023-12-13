// import 'package:bookbuzz/pages/main_page.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:bookbuzz/data/store/books_repository.dart';
import 'package:bookbuzz/provider/club_provider.dart';
import 'package:bookbuzz/provider/profile_provider.dart';
import 'package:bookbuzz/firebase_options.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/store/user_book_situation_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Erro ao inicializar o Firebase: $e");
    // Você pode tratar o erro de inicialização do Firebase aqui
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BooksRepository(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserBookSituationStore(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ClubProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookbuzz',
      debugShowCheckedModeBanner: false,
      theme: AppColors.getTheme(),
      initialRoute: '/welcome',
      routes: AppRoute.getRoutes(),
    );
  }
}
