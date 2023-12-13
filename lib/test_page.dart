// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo de Estilos de Texto'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Display Large',
              style: AppText.displayLarge,
            ),
            Text(
              'Display Medium',
              style: AppText.displayMedium,
            ),
            Text(
              'Display Small',
              style: AppText.displaySmall,
            ),
            Text(
              'Headline Large',
              style: AppText.headlineLarge,
            ),
            Text(
              'Headline Medium',
              style: AppText.headlineMedium,
            ),
            Text(
              'Headline Small',
              style: AppText.headlineSmall,
            ),
            Text(
              'Title Large',
              style: AppText.titleLarge,
            ),
            Text(
              'Title Medium',
              style: AppText.titleMedium,
            ),
            Text(
              'Title Small',
              style: AppText.titleSmall,
            ),
            Text(
              'Body Large',
              style: AppText.bodyLarge,
            ),
            Text(
              'Body Medium',
              style: AppText.bodyMedium,
            ),
            Text(
              'Body Small',
              style: AppText.bodySmall,
            ),
            Text(
              'Label Large',
              style: AppText.labelLarge,
            ),
            Text(
              'Label Medium',
              style: AppText.labelMedium,
            ),
            Text(
              'Label Small',
              style: AppText.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
