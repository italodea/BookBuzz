// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/general_components/my_book_loading.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../styles/app_text.dart';

class LoadingCategories extends StatelessWidget {
  const LoadingCategories({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Text(
              "...",
              style: AppText.displaySmall.merge(AppText.secondaryDarkColor),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          // SizedBox(
          //   height: 160,
          //   width: 100,
          //   child: Image.asset('assets/animations/animation2.gif'),
          // ),

          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyBookLoading(),
                  MyBookLoading(),
                  MyBookLoading(),
                  MyBookLoading(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
