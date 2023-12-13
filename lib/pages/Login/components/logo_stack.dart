import 'package:flutter/material.dart';

class LogoStack extends StatelessWidget {
  const LogoStack({super.key, this.rightPadding});
  final double? rightPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Align(
            alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/component1.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50, right: rightPadding ?? 0),
          child: Center(
            child: Image.asset(
              'assets/logo/logo-transparent.png',
              height: 200,
            ),
          ),
        ),
      ],
    );
  }
}
