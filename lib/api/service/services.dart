import 'dart:convert';

import 'package:get/get.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:http/http.dart' as http;

List urls = [
  //Up_coming0
  "https://api.themoviedb.org/3/movie/upcoming?api_key=6f6bec68f0623b4828d99817d2ef4f75&language=en-US&page=1",
  //Popular1
  "https://api.themoviedb.org/3/movie/popular?api_key=6f6bec68f0623b4828d99817d2ef4f75&language=en-US&page=1",
  //Trending2
  "https://api.themoviedb.org/3/movie/top_rated?api_key=6f6bec68f0623b4828d99817d2ef4f75&language=en-US&page=1",
  //Top_Rated3
  "https://api.themoviedb.org/3/trending/all/day?api_key=6f6bec68f0623b4828d99817d2ef4f75",
  //NowPlaying4
  "https://api.themoviedb.org/3/movie/now_playing?api_key=6f6bec68f0623b4828d99817d2ef4f75&language=en-US&page=1",
];

class DownloadService extends GetxController {
  Future<List<NetflixModel>?> getMethod(String url) async {
    var response = await http.get(Uri.parse(url));
     
  

    if (response.statusCode == 200) {
      Map<String, dynamic> body = await json.decode(response.body);

      List allData = body["results"];

      List<NetflixModel> modelClassData = allData
          .map(
            (e) => NetflixModel(
              title: e["title"],
              image: e["poster_path"],
              overview: e["overview"],
              releaseDate: e["release_date"],
            ),
          )
          .toList();
      return modelClassData;
    } else {
      return null;
    }
  }
}