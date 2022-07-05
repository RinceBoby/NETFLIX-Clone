import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        //print('rendering');

        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              label: "New & Hot",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.emoji_emotions_outlined,
              ),
              label: "Fast Laughs",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.arrow_down_circle,
              ),
              label: "Downloads",
            ),
          ],
        );
      },
    );
  }
}
