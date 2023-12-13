import 'package:bookbuzz/styles/app_text.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.text, required this.value});
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            text,
            style: AppText.titleMedium.merge(AppText.blackColor),
          ),
          Text(
            value,
            style: AppText.titleSmall.merge(AppText.blackColor),
          ),
        ],
      ),
    );
  }
}
