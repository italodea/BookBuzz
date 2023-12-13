// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/pages/Profile/edit_profile_page.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ConfigProfilePage extends StatelessWidget {
  const ConfigProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: Column(
            children: [
              Text("Minha conta",
                  style: AppText.bodyMedium.merge(AppText.blackColor)),
              ListTile(
                leading: Icon(Icons.person),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                title: Text('Meus dados - Perfil'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.lock),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                title: Text('Alterar senha'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfigProfilePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
