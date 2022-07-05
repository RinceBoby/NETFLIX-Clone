import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  final Color textColor;
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.iconSize,
    required this.textSize,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(
            color: kWhite,
            fontSize: textSize,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
