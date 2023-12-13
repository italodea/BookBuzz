// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBookLoading extends StatelessWidget {
  const MyBookLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.grey,
          height: 160,
          width: 100,
        ),
      ),
    );
  }
}
