import 'package:get/get.dart';
import 'package:xpertbot/Controllers/SignupController.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=> SignupController());
  }
}