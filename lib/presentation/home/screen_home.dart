import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/widgets/main_home_title_card.dart';
import 'package:netflix/presentation/widgets/released_in_the_pastyear.dart';
import '../../core/constants.dart';
import 'widgets/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

// ignore: must_be_immutable
class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  Controller netflixController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCard(),
                    ReleasedInThePastYear(
                      title: "Released in the Past Year",
                      items: netflixController.upcoming,
                      icon: CupertinoIcons.play_circle,
                    ),
                    
                    MainHomeTitleCard(
                      title: "Trending Now",
                      items: netflixController.nowPlaying,
                    ),
                    NumberTitleCard(
                      title: "Top 10 TV Shows In India Today",
                      items: netflixController.topRated,
                    ),
                    MainHomeTitleCard(
                      title: "Tense Dramas",
                      items: netflixController.upcoming,
                    ),
                    MainHomeTitleCard(
                      title: "South Indian Cinemas",
                      items: netflixController.trending,
                    ),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(
                          seconds: 2,
                        ),
                        curve: Curves.fastOutSlowIn,
                        width: double.infinity,
                        height: 80,
                        color: Colors.transparent.withOpacity(.4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                kWidth,
                                SizedBox(
                                  width: 28,
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/netflixlogo.png",
                                    fit: BoxFit.cover,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "TV Shows",
                                  style: kHomePageTextStyle,
                                ),
                                const Text(
                                  "Movies",
                                  style: kHomePageTextStyle,
                                ),
                                LimitedBox(
                                  child: GestureDetector(
                                    onTap: () {
                                      _showCategoriesList(context);
                                    },
                                    child: Row(
                                      children: const [
                                        Text(
                                          "Categories",
                                          style: kHomePageTextStyle,
                                        ),
                                        Icon(
                                          Icons.arrow_drop_down_rounded,
                                          color: kWhite,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Categories_List>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
Future<Object?> _showCategoriesList(BuildContext context) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) => Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      body: Column(
        children: const [
          SizedBox(height: 50),
          CategoriesListWidget(),
          SizedBox(height: 20),
          ClossButtonWidget(),
          SizedBox(height: 30)
        ],
      ),
    ),
  );
}

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext _context, int _index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                homeCategories[_index],
                style: kHomePageTextStyle,
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext _cx, int _indx) {
          return const SizedBox(height: 35);
        },
        itemCount: 20,
      ),
    );
  }
}

class ClossButtonWidget extends StatelessWidget {
  const ClossButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      radius: 25,
    );
  }
}

List<String> homeCategories = [
  'Home',
  'My List',
  'Available for Download',
  'Hindi',
  'Tamil',
  'Punjabi',
  'Telugu',
  'Malayalam',
  'Marathi',
  'Bengali',
  'English',
  'Action',
  'Anime',
  'Award Winners',
  'Biographical',
  'Blockbusters',
  'Bollywood',
  'Children & Family',
  'Comedies',
  'Documentaries',
  'Dramas',
  'Fantasy',
  'Hollywood',
  'Hurror',
  'International',
  'Indian'
];
