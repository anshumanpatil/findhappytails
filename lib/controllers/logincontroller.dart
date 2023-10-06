import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:findhappytails/models/loginresult.dart';
import 'package:findhappytails/constants.dart' as Constants;

class LoginController extends GetxController {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  Future<bool> login() async {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(loginEmailController.text);
    if (!emailValid) {
      Get.snackbar('Login', 'Please enter email id correctly.');
      return Future.value(false);
    }
    EasyLoading.show(status: 'Login...');

    try {
      var callLoginResponse = await fetchResult(loginEmailController.text, loginPasswordController.text);
      final prefs = await SharedPreferences.getInstance();
      final setTokenStatus = await prefs.setString("token", callLoginResponse.token);
      // print("callLoginResponse userid ${callLoginResponse.token}");
      // print("Email ${loginEmailController.text}");
      // print("Password ${loginPasswordController.text}");
      Get.snackbar('Login', 'Login Succesful.');
      return Future.value(setTokenStatus);
    } catch(e) {
      Get.snackbar('Login', 'Error occured while logging in.');
      return Future.value(false);
    }
  }

  Future<LoginResult> fetchResult(String email,
      String password) async {
    String url = Constants.ServerURL;
    String URLForLogin = '$url${Constants.LoginMethod}';
    final response = await http.post(Uri.parse(URLForLogin), body: {'email': email, 'password': password});
    print(URLForLogin);
    print("response.statusCode ${response.statusCode.toString()}");
    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      Get.snackbar('Login', 'Login Succesful.');

      return LoginResult.fromJson(response.body);

    } else {
      EasyLoading.dismiss();
      Get.snackbar('Login', 'Error occured while logging in.');
      throw Exception('Failed to login');
    }

  }
}
