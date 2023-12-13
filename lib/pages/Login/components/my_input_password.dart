// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bookbuzz/styles/app_colors.dart';

class MyInputPassword extends StatefulWidget {
  MyInputPassword({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
    this.obscure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  bool obscure;
  final String? Function(String?) validator;

  @override
  _MyInputPasswordState createState() => _MyInputPasswordState();
}

class _MyInputPasswordState extends State<MyInputPassword> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF3F3F3),
        label: Text(widget.label),
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
        suffixIcon: IconButton(
          icon: Icon(
            widget.obscure ? Icons.visibility_off : Icons.visibility,
            color: Color(0xFF666161),
          ),
          onPressed: () {
            setState(() {
              widget.obscure = !widget.obscure;
            });
          },
        ),
      ),
      validator: widget.validator,
    );
  }
}
