import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/api/model/netflix_model.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  List<NetflixModel> items;
  final listController = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final data = items[index];
          return Row(
            children: [
              SizedBox(
                width: 50,
                height: 480,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "FEB",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "11",
                      style: GoogleFonts.cabin(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: kWhite,
                        letterSpacing: 5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width - 50,
                height: 480,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            backgroundColor:
                                Colors.transparent.withOpacity(0.6),
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
                    kHeight15,
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 100,
                          child: Text(
                            data.title.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        const Spacer(),
                        const CustomButtonWidget(
                          icon: CupertinoIcons.bell,
                          iconSize: 20,
                          title: "Remind Me",
                          textSize: 14,
                          textColor: Colors.grey,
                        ),
                        kWidth,
                        const CustomButtonWidget(
                          icon: CupertinoIcons.info,
                          title: "Info",
                          iconSize: 20,
                          textSize: 12,
                          textColor: Colors.grey,
                        ),
                        kWidth2,
                      ],
                    ),
                    kHeight,
                    Text(
                      data.releaseDate.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                      maxLines: 4,
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
