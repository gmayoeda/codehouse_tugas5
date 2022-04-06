import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'controller/profile_controller.dart';
import 'repository/repository.dart';

class Injector extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => NewsRepository());
  }
}
