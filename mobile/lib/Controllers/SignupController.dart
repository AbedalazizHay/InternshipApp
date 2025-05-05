import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xpertbot/Core/Network/DioClient.dart';
import 'package:xpertbot/Core/ShowSuccessDialog.dart';
import 'package:xpertbot/Models/User.dart';

class SignupController extends GetxController{
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void signup() async{
    User user = User(
      userName: username.text,
      email: email.text,
      password: password.text,
      first_name: "Abedalaziz",
      last_name: "Hay",
      gender: "male",
      institution_id: 1,
      academic_level_id: 3,
      
      
      //test
    );
    String requestBody = user.toJson();
    var post = await Dioclient().getInstance().post( '/signup', data: requestBody);
    if (post.data['Registered successfully']){
    if (post.statusCode == 200){
      ShowSuccessDialog(Get.context!, "Success", "Registered successfully", (){});
    }else{
      ShowSuccessDialog(Get.context!, "Error", "User Registration Failed", (){});
    }
    }else {
      ShowSuccessDialog(Get.context!,"Failed", "User logged in Failed",(){});
    }
      
      // Navigate to success page or perform any other action
  }
}
