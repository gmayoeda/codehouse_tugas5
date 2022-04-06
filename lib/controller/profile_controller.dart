import 'package:codehouse_tugas5/loginpage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  String name = "", email = "";
  late SharedPreferences sharedPreferences;

  void getPref() async {
    sharedPreferences = await SharedPreferences.getInstance();

    name = sharedPreferences.getString("name")!;
    email = sharedPreferences.getString("email")!;
  }

  void logout() {
    sharedPreferences.clear();
    Get.offAll(LoginPage());
  }

  @override
  void onReady() {
    getPref();
    super.onReady();
  }
}
