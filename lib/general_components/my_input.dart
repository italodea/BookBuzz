// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  const MyInput({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
    this.obscure = false,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged, // Adicionar o callback onChanged
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool obscure;
  final String? Function(String?)
      validator; // Tipo de validador alterado para String? Function(String?)
  final int maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF3F3F3),
        label: Text(label),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        floatingLabelStyle: TextStyle(color: AppColors.blackColor),
        border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.secondaryColor,
            width: 4,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 4,
            style: BorderStyle.solid,
          ),
        ),

        //hoverColor: Colors.transparent,
      ),
      //cursorColor: AppColors.secondaryColor,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
