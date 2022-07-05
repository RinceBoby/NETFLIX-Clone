import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/colors/colors.dart';

import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  EveryonesWatchingWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  List<NetflixModel> items;

  final listController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext content, index) {
        final data = items[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight,
              Text(
                data.title.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                data.overview.toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              kHeight20,
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                      kBaseUrl + data.image.toString(),
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
              ),
              kHeight20,
              Row(
                children: [
                  kWidth2,
                  Center(
                    child: SizedBox(
                      height: 60,
                      width: 90,
                      child: Text(
                        data.title.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const CustomButtonWidget(
                    icon: CupertinoIcons.paperplane,
                    iconSize: 30,
                    title: "Share",
                    textSize: 15,
                    textColor: Colors.grey,
                  ),
                  kWidth,
                  const CustomButtonWidget(
                    icon: CupertinoIcons.add,
                    title: "My List",
                    iconSize: 30,
                    textSize: 15,
                    textColor: Colors.grey,
                  ),
                  kWidth,
                  const CustomButtonWidget(
                    icon: CupertinoIcons.play_fill,
                    title: "Play",
                    iconSize: 30,
                    textSize: 15,
                    textColor: Colors.grey,
                  ),
                  kWidth,
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
