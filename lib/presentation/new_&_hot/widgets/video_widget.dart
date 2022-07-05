import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "http://miftyisbored.com/wp-content/uploads/captain-america-winter-soldier-main-poster.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 5,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.transparent.withOpacity(0.6),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.speaker_slash,
                size: 20,
                color: kWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}