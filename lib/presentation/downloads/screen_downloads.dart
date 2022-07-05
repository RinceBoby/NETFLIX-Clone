import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding:const EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgetList[index],
        separatorBuilder: (context, index) => const SizedBox(height: 50),
        itemCount: _widgetList.length,
      ),
    );
  }
}

//<<<<<Section_1>>>>>//
class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings_rounded,
          color: kWhite,
        ),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

//<<<<<Section_2>>>>>//
class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  final List image = [
    "/49WJfeN0moxb9IPfGn8AIqMGskD.jpg",
    "/rPWaktPt50BwkYHmYM62sDrdnjR.jpg",
    "/4zLfBbGnuUBLbMVtagTZvzFwS8l.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          style: TextStyle(
            color: kWhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something for watch on your\ndevice.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.height * .4,
          //color: Colors.white,

          //<<<<<Circle>>>>>//
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.38,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                ),
              ),

              //<<<<<Posters>>>>>//
              DownloadsImageWidget(
                image: image[1],
                size: Size(size.width * .37, size.width * 0.54),
                margin: const EdgeInsets.only(left: 170, bottom: 32),
                angle: 17,
              ),
              DownloadsImageWidget(
                image: image[2],
                size: Size(size.width * .37, size.width * 0.54),
                margin: const EdgeInsets.only(right: 170, bottom: 32),
                angle: -17,
              ),
              DownloadsImageWidget(
                image: image[0],
                size: Size(size.width * .43, size.width * 0.62),
                margin: const EdgeInsets.only(right: 0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//<<<<<Section_3>>>>>//
class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //<<<<<Icons>>>>>//
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kBlueButton,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set Up",
                style: TextStyle(
                  color: kWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kWhiteButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                color: kBlack,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}

//<<<<<Poster_Widget>>>>>//
class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.image,
    required this.margin,
    required this.size,
    this.angle = 0,
  }) : super(key: key);

  final String image;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: kBlack,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(kBaseUrl+
              image,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
