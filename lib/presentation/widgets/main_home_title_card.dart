import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainHomeTitleCard extends StatelessWidget {
  final String title;
  final IconData? icon;

  MainHomeTitleCard({
    Key? key,
    required this.title,
    required this.items,
    this.icon,
  }) : super(key: key);

  List<NetflixModel> items;
  final listController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kHeight,
          LimitedBox(
            maxHeight: 200,
            child: Stack(
              children: [
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    items.length,
                    (index) {
                      final data = items[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Stack(
                          children: [
                            Container(
                              width: 110,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: kRadius,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    kBaseUrl + data.image.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 18,
                              top: 60,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(icon),
                                color: kWhite,
                                iconSize: 60,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
