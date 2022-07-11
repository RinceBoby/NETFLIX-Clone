import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api/controller/controller.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/widgets/title.dart';

import '../../core/colors/colors.dart';
import 'controller/search_controller.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  Controller listController = Get.find<Controller>();

  TextEditingController searchTextContorll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchControll = Get.put(SearchController());
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: searchTextContorll,
                onChanged: (value) {
                  searchControll.putData(value);
                },
                backgroundColor: Colors.grey.withOpacity(.35),
                prefixIcon: const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              Obx(
                () {
                  if (searchTextContorll.text.isEmpty) {
                    searchControll.putData("movies & TV");
                  }
                  return Expanded(
                    child: searchTextContorll.text.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SearchTitle(title: "Top Searches"),
                              kHeight,
                              Expanded(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final data =
                                        // ignore: invalid_use_of_protected_member
                                        searchControll.data.value[index];
                                    return Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: screenWidth * 0.39,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                kBaseUrl +
                                                    data.image.toString(),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              data.title.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          CupertinoIcons.play_circle,
                                          color: kWhite,
                                          size: 45,
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      kHeight15,
                                  // ignore: invalid_use_of_protected_member
                                  itemCount: searchControll.data.value.length,
                                ),
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SearchTitle(title: "Movies & TV"),
                              kHeight,
                              Expanded(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 1 / 1.4,
                                  children: List.generate(
                                    // ignore: invalid_use_of_protected_member
                                    searchControll.data.value.length,
                                    (index) {
                                      final allData =
                                          // ignore: invalid_use_of_protected_member
                                          searchControll.data.value[index];

                                      return SizedBox(
                                        height: 200,
                                        width: 110,
                                        child: allData.image == null
                                            ? const Center(
                                                child: Text("No Image Found"),
                                              )
                                            : Image.network(
                                                kBaseUrl +
                                                    allData.image.toString(),
                                              ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
