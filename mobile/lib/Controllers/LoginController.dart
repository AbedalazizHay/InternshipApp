import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xpertbot/Core/Network/DioClient.dart';
import 'package:xpertbot/Models/User.dart';

class Logincontroller extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void login() async{
    User user = User(
      email: email.text,
      password: password.text
    );
    // String requestBody = user.toJson();
    // var post = await Dioclient().getInstance()
  }
}