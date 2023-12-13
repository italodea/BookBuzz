// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bookbuzz/pages/Profile/config_profile_page.dart';
import 'package:bookbuzz/pages/Profile/edit_profile_page.dart';
import 'package:bookbuzz/test_page.dart';
import 'package:bookbuzz/general_components/my_horizontal_divider.dart';
import 'package:bookbuzz/pages/Club/club_page.dart';
import 'package:bookbuzz/pages/Books/books_page.dart';
import 'package:bookbuzz/routes/app_routes.dart';
import 'package:bookbuzz/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          children: [
            // Itens no topo
            ListTile(
              leading: Icon(Icons.feed_outlined),
              title: Text('Clube'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClubPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text('Livros'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Perfil'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border_rounded),
              title: Text('Salvos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text('Configurações'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConfigProfilePage()),
                );
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.settings_outlined),
            //   title: Text('Configurações'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => TestPage()),
            //     );
            //   },
            // ),
            MyHorizontalDivider(
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            // Spacer(), // Espaçamento dinâmico
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Sair'),
              onTap: () async {
                bool logoutSuccess = await AuthService().logout();
                if (logoutSuccess) {
                  Navigator.pushReplacementNamed(context, AppRoute.WELCOME);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
