import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xpertbot/Core/Network/DioClient.dart';
import 'package:xpertbot/Core/ShowSuccessDialog.dart';
import 'package:xpertbot/Models/User.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
 
  void login() async {
  try {
    final response = await Dioclient().getInstance().post('/login', data: {
      'email': email.text,
      'password': password.text,
    });

    if (response.statusCode == 200) {
      ShowSuccessDialog(
        Get.context!,
        "Success",
        "User logged in successfully",
        () {},
      );
    }
  } on DioException catch (e) {
    final data = e.response?.data;

    if (e.response?.statusCode == 403 && data != null) {
      final message = data['message'] ?? 'Account not active';
      final paymentUrl = data['payment_api_url'];

      ShowSuccessDialog(
        Get.context!,
        "Account Not Active",
        "$message\n\nClick OK to proceed to payment.",
        () {
          if (paymentUrl != null) {
            // You can launch the URL
            // using url_launcher package:
            // launchUrl(Uri.parse(paymentUrl));
          }
        },
      );
    } else {
      ShowSuccessDialog(
        Get.context!,
        "Login Failed",
        "Something went wrong: ${e.message}",
        () {},
      );
    }
  } catch (e) {
    ShowSuccessDialog(Get.context!, "Error", "Unexpected error: $e", () {});
  }
}
}