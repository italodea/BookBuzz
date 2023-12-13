// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../styles/app_text.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.controller, this.onChanged});
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        boxShadow: AppColors.shadow,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.topRight,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        cursorHeight: 20,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.secondaryColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.whiteColor,
            ),
          ),
          hintText: 'Pesquisar',
          hintStyle: AppText.blackColor,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
