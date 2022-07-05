import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/presentation/fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  ScreenFastLaughs({Key? key}) : super(key: key);

  Controller netflixController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VideoListItem(items: netflixController.trending),
        
      ),
    );
  }
}
