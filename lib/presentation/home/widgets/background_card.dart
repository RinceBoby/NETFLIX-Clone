import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

import '../../../core/colors/colors.dart';
import 'custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard({Key? key}) : super(key: key);

  final List image = ["/4zLfBbGnuUBLbMVtagTZvzFwS8l.jpg"];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kBaseUrl + image[0]),
              fit: BoxFit.fitHeight,
            ),
            color: kWhite,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              //<<<<<Buttons>>>>>//
              children: [
                const CustomButtonWidget(
                  icon: CupertinoIcons.add,
                  iconSize: 30,
                  title: "My List",
                  textSize: 16,
                  textColor: kWhite,
                ),
                _PlayButton(),
                const CustomButtonWidget(
                  icon: CupertinoIcons.info,
                  iconSize: 30,
                  title: "Info",
                  textSize: 16,
                  textColor: kWhite,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  //<<<<<Play>>>>>//
  TextButton _PlayButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhite),
      ),
      icon: const Icon(
        CupertinoIcons.play_fill,
        color: kBlack,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(
            color: kBlack,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
