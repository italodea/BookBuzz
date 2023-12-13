// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/general_components/my_horizontal_divider.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class BooksCommentsArea extends StatefulWidget {
  const BooksCommentsArea({super.key, required this.id});

  final String id;
  @override
  State<BooksCommentsArea> createState() => _BooksCommentsAreaState();
}

class _BooksCommentsAreaState extends State<BooksCommentsArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppColors.shadow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  "Avaliações",
                  style: AppText.displaySmall.merge(AppText.blackColor),
                ),
              ),
            ],
          ),
          ListView.builder(
              itemCount: 4,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/17/17004.png",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nome do usuário",
                                style: AppText.bodyMedium
                                    .merge(AppText.blackColor),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisl eget nunc aliquam aliquet. Donec euismod, nisl eget aliquam aliquet, nisl nisl aliquam.",
                                style:
                                    AppText.bodySmall.merge(AppText.blackColor),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    index != 3
                        ? Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: MyHorizontalDivider(
                              width: MediaQuery.of(context).size.width * 0.9,
                            ),
                          )
                        : SizedBox(height: 18,),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
