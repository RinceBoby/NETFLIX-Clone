import 'package:get/get.dart';
import 'package:netflix/api/model/netflix_model.dart';
import 'package:netflix/api/service/services.dart';

class Controller extends GetxController {
  List<NetflixModel> upcoming = [];
  List<NetflixModel> popular = [];
  List<NetflixModel> trending = [];
  List<NetflixModel> nowPlaying = [];
  List<NetflixModel> topRated = [];

  var Loading = true.obs;

  Future<List<NetflixModel>> getData(String url) async {
    Loading.value = true;
    try {
      var data = await DownloadService().getMethod(url);
      Loading.value = false;
      return data!;
    } catch (e) {
      Get.snackbar("Sorry!!", "$e");
      Loading.value = false;
      return [];
    }
  }

  @override
  void onInit() {
    getData(urls[0]).then((value) => upcoming = value);
    getData(urls[1]).then((value) => nowPlaying = value);
    getData(urls[2]).then((value) => topRated = value);
    getData(urls[3]).then((value) => popular = value);
    getData(urls[4]).then((value) => trending = value);
  }
}
