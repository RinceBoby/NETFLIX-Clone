import 'package:get/get.dart';
import 'package:netflix/presentation/search/model/search_model.dart';
import 'package:netflix/presentation/search/services/search_services.dart';

class SearchController extends GetxController{
  var loading = true.obs;
  RxList<SearchModel> data = <SearchModel>[].obs;
  putData(query) async{
    data.value = await SerachService().postMethod(query);
  }
  @override
  void onInit() {
    putData("movies & TV");
    super.onInit();
  }
}