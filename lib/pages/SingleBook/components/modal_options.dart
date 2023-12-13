// ignore_for_file: prefer_const_constructors

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ModalOptions extends StatefulWidget {
  const ModalOptions({super.key});

  @override
  State<ModalOptions> createState() => _ModalOptionsState();
}

class OptionButton {
  final String text;
  bool isSelected;

  OptionButton(this.text, this.isSelected);
}

class _ModalOptionsState extends State<ModalOptions> {
  List<OptionButton> buttons = [
    OptionButton('Já li', false),
    OptionButton('Lendo', false),
    OptionButton('Quero ler', false),
    OptionButton('Desisti', false),
  ];

  void selectButton(int index) {
    setState(() {
      for (int i = 0; i < buttons.length; i++) {
        if (i == index) {
          buttons[i].isSelected = !buttons[i].isSelected;
        } else {
          buttons[i].isSelected = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Make a modal bottom sheet
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 15),
      backgroundColor: AppColors.backgroundColor,
      title: Center(
          child: Text(
        'Status de leitura',
        style: AppText.displaySmall.merge(AppText.secondaryDarkColor),
      )),
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                for (int i = 0; i < buttons.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        selectButton(i);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttons[i].isSelected
                            ? AppColors.primaryDarkColor
                            : AppColors.backgroundColor,
                      ),
                      child: Text(
                        buttons[i].text,
                        style: TextStyle(
                          color: buttons[i].isSelected
                              ? AppColors.backgroundColor
                              : AppColors.primaryDarkColor,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
