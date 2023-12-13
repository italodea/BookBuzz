// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.function});

  final Icon icon;
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Column(
        children: [
          icon,
          Text(text),
        ],
      ),
    );
  }
}
