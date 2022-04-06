import 'package:get/get.dart';
import 'package:codehouse_tugas5/model/news.dart';
import 'package:codehouse_tugas5/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  String name = "", email = "", urlnya = "";
  late SharedPreferences sharedPreferences;

  NewsRepository newsRepository = Get.find<NewsRepository>();
  RxList list_news = <News>[].obs;
  RxBool isLoading = false.obs;

  void callAPI() {
    isLoading.value = true;
    newsRepository.getNews().then((List<News> value) {
      list_news.addAll(value);
      isLoading.value = false;
    }).catchError((err, track) {
      print("Error ${err} ${track}");
    });
  }

  getPref() async {
    sharedPreferences = await SharedPreferences.getInstance();

    name = sharedPreferences.getString("name")!;
    email = sharedPreferences.getString("email")!;
  }

  link(String urlnya) async {
    final link = urlnya;
    await launch('$link');
  }

  @override
  void onReady() {
    callAPI();
    getPref();
    super.onReady();
  }
}
