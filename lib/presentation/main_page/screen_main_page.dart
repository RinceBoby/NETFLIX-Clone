import 'package:flutter/material.dart';
import 'package:netflix/presentation/downloads/screen_downloads.dart';
import 'package:netflix/presentation/fast_laughs/Screen_fast_Laughs.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix/presentation/new_&_hot/screen_new_&_hot.dart';
import 'package:netflix/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaughs(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            }),
      ),

      //<<<<<Bottom_Nav_Bar>>>>>//
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
