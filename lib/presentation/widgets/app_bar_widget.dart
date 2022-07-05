import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;

  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          kWidth,
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.cast_rounded,
            color: Colors.white,
            size: 30,
          ),
          kWidth,
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              "assets/images/smiley.png",
              fit: BoxFit.cover,
            ),
          ),
          kWidth,
        ],
      ),
    );
  }
}
