import 'dart:convert';

import 'package:netflix/presentation/search/model/search_model.dart';
import 'package:http/http.dart' as http;

class SearchService {
  Future<List<SearchModel>> postMethod(String query) async {
    var response = await http.get(
      Uri.parse(
        "https://api.themoviedb.org/3/search/movie?api_key=6f6bec68f0623b4828d99817d2ef4f75&language=en-US&query=$query&page=1&include_adult=false",
      ),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> body = await json.decode(response.body);
      List allSearchData = body["results"];
      List<SearchModel> modelClassData = allSearchData
          .map(
            (e) => SearchModel(
              title: e["title"],
              image: e["poster_path"],
              overview: e["overview"],
              releaseDate: e["release_date"],
            ),
          )
          .toList();
      return modelClassData;
    } else {
      return [];
    }
  }
}
