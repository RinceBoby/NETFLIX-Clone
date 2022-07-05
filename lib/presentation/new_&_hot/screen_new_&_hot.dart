import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/new_&_hot/widgets/everyones_watching.dart';

import '../../core/constants.dart';
import 'widgets/coming_soon_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  ScreenNewAndHot({Key? key}) : super(key: key);

  Controller netflixController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              const Icon(
                Icons.cast_rounded,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    "assets/images/smiley.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              kWidth,
            ],
            bottom: TabBar(
              labelColor: kBlack,
              unselectedLabelColor: kWhite,
              isScrollable: true,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kWhite,
                borderRadius: kRadius3,
              ),
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Tab(
                    text: "🍿 Coming Soon",
                  ),
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ComingSoonWidget(items: netflixController.upcoming),
            EveryonesWatchingWidget(items: netflixController.trending),
          ],
        ),
      ),
    );
  }
}
