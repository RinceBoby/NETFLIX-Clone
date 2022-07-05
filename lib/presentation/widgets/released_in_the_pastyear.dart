import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

import '../../api/controller/controller.dart';
import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class ReleasedInThePastYear extends StatelessWidget {
  final String title;
  final IconData? icon;

  ReleasedInThePastYear({
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
            maxHeight: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                items.length,
                (index) {
                  final data = items[index];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          width: 110,
                          height: 150,
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                kBaseUrl + data.image.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(icon),
                              color: kWhite,
                              iconSize: 60,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey[600],
                          height: 40,
                          width: 110,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.info_outline,
                                color: kWhite,
                                size: 30,
                              ),
                              Icon(
                                Icons.more_vert,
                                color: kWhite,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
