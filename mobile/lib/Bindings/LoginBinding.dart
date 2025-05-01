import 'package:get/get.dart';
import 'package:xpertbot/Controllers/LoginController.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> Logincontroller());
  }
}