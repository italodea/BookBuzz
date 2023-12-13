// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bookbuzz/styles/app_colors.dart';
import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class MyExpandedCard extends StatefulWidget {
  const MyExpandedCard({
    super.key,
    required this.title,
    required this.description,
    this.showPreview = true,
  });

  final String title;
  final String description;
  final bool showPreview;

  @override
  State<MyExpandedCard> createState() => _MyExpandedCardState();
}

class _MyExpandedCardState extends State<MyExpandedCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppColors.shadow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                widget.title,
                style: AppText.displaySmall.merge(AppText.blackColor),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
              ),
            )
          ],
        ),
        !isExpanded && widget.showPreview
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        widget.description,
                        style: AppText.bodySmall,
                        maxLines: 3,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
        isExpanded
            ? Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Text(
                        widget.description,
                        style: AppText.bodySmall,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ]),
    );
  }
}
