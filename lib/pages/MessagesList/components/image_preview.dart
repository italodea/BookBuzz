// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview(
      {super.key, required this.imagePath, required this.action});
  final String imagePath;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: AppColors.blackColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      "Cancelar",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await action(imagePath);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.done,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      "Ok",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.blackColor,
      body: Stack(
        children: [
          Image.file(
            File(imagePath),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
