import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/api/model/netflix_model.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  
  NumberTitleCard({
    Key? key,
    required this.items,
    required this.title,
  }) : super(key: key);

  List<NetflixModel> items;
  final listController = Get.put(Controller());
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           MainTitle(title: title),
          kHeight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                items.length,
                (index) {
                  final data = items[index];
                  return Stack(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 35,
                            height: 200,
                          ),
                          Container(
                            width: 110,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: kRadius,
                              color: Colors.purpleAccent,
                              image: DecorationImage(
                                image: NetworkImage(
                                  kBaseUrl + data.image.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        bottom: -24,
                        child: BorderedText(
                          strokeWidth: 6.0,
                          strokeColor: kWhite,
                          child: Text(
                            "${index + 1}",
                            style: GoogleFonts.workSans(
                                fontSize: 125,
                                fontWeight: FontWeight.bold,
                                color: kBlack),
                          ),
                        ),
                      ),
                    ],
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
