// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/general_components/my_horizontal_divider.dart';
import 'package:bookbuzz/data/models/user.dart';
import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class ClubMember extends StatelessWidget {
  const ClubMember({super.key, required this.members});

  final List<User> members;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListView.builder(
              primary: false,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                User user = User(
                    id: 1,
                    name: "Nome do usuario",
                    email: "italodea@gmail.com",
                    urlPhoto:
                        "https://cdn.ecommercedns.uk/files/2/241162/5/19636125/8052-1.png");

                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: AppColors.backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 0,
                                  spreadRadius: 2,
                                  color: AppColors.primaryColor,
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/placeholder.png',
                                image: user.urlPhoto,
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              user.name,
                              style: AppText.headlineMedium.merge(
                                AppText.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
