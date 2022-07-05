import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class VideoListItem extends StatelessWidget {
  VideoListItem({
    Key? key,
    required this.items,
  }) : super(key: key);

  List<NetflixModel> items;
  final listController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: items.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = items[index];
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(kBaseUrl + data.image.toString(),),
                      fit: BoxFit.fill,
                    ),
                  ),
                  //color: Colors.accents[index % Colors.accents.length],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //
                        //<<<<<Mute_Button>>>>>//
                        CircleAvatar(
                          backgroundColor: Colors.transparent.withOpacity(0.6),
                          radius: 30,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.speaker_slash,
                              size: 30,
                              color: kWhite,
                            ),
                          ),
                        ),
          
                        //<<<<<Right_Side>>>>>//
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(kBaseUrl + data.image.toString()),
                            ),
                            kHeight,
                            VideoActionsWidget(
                              icon: Icons.emoji_emotions_rounded,
                              title: "LOL",
                            ),
                            VideoActionsWidget(
                              icon: CupertinoIcons.add,
                              title: "My List",
                            ),
                            VideoActionsWidget(
                              icon: CupertinoIcons.paperplane,
                              title: "Share",
                            ),
                            VideoActionsWidget(
                              icon: CupertinoIcons.play_arrow_solid,
                              title: "Play",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

//<<<<<Right_Side_Button>>>>>//
class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhite,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
