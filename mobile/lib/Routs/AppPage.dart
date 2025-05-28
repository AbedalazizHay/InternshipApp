import 'package:get/get.dart';
import 'package:xpertbot/Routs/AppRout.dart';
import 'package:xpertbot/pages/login.dart';
import 'package:xpertbot/pages/signup.dart';
import 'package:xpertbot/Bindings/LoginBinding.dart';
import 'package:xpertbot/Bindings/SignupBinding.dart';
class AppPage {
static final List <GetPage> pages= [
  GetPage(name: AppRout.signup, page: () => Signup(), binding: SignupBinding()),
   GetPage(name: AppRout.login, page: () => Login(), binding: SignupBinding()),
];


}