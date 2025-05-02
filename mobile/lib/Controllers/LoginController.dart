import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xpertbot/Core/Network/DioClient.dart';
import 'package:xpertbot/Core/ShowSuccessDialog.dart';
import 'package:xpertbot/Models/User.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void login() async{
    User user = User(
      email: email.text,
      password: password.text
    );
    String requestBody = user.toJson();
    var post = await Dioclient().getInstance().post('/login', data: requestBody);
    if (post.data['Your account is not yet active. Please complete your payment to proceed.']){
      if (post.statusCode==200){
        ShowSuccessDialog(Get.context!,"Success", "User logged in successfully",(){});
        

      }else {
          ShowSuccessDialog(Get.context!,"Failed", "User logged in Failed",(){});
      }
    }else {
      ShowSuccessDialog(Get.context!,"Failed", "User logged in Failed",(){});
    }
  }
}