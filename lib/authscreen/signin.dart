import 'package:findhappytails/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:findhappytails/custtomscreen/appbar.dart';
import 'package:findhappytails/custtomscreen/button.dart';
import 'package:findhappytails/custtomscreen/passwordcusttomtextfild.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../custtomscreen/textfild.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final loginController = Get.put(LoginController());

  // getdarkmodepreviousstate() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   bool? previusstate = prefs.getBool("setIsDark");
  //   if (previusstate == null) {
  //     notifier.setIsDark = false;
  //   } else {
  //     notifier.setIsDark = previusstate;
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdarkmodepreviousstate();
  }

  //late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(LanguageEn.signin),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.loginwithyouraccount,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 30),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.email,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 100),
            Container(
              color: Colors.transparent,
              height: height / 13,
              width: width / 1.1,
              child: TextField(
                controller: loginController.loginEmailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintText: "Email ID",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 70),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.password,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 100),
            Container(
              color: Colors.transparent,
              height: height / 13,
              width: width / 1.1,
              child: TextField(
                controller: loginController.loginPasswordController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xffE0E0E0),
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 200),
            Row(
              children: [
                SizedBox(width: width / 1.7),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Forgotpassword');
                  },
                  child: Text(
                    LanguageEn.forgotpassword,
                    style: TextStyle(
                      color: const Color(0xffFC9340),
                      fontFamily: 'GilroyBold',
                      fontSize: height / 50,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: height / 3.3),
            GestureDetector(
              onTap: () async {
                var loginResult = await loginController.login();
                if(loginResult) {
                  Navigator.pushNamed(context, '/Bottomhome');
                }
                //
              },
              child: Custombutton.button(
                LanguageEn.login,
                width / 1.1,
                Colors.transparent,
                const Color(0xffFC9340),
                Colors.white,
              ),
            ),
            SizedBox(height: height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LanguageEn.donthaveanaccountyet,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/Register');
                  },
                  child: Text(
                    LanguageEn.register,
                    style: TextStyle(
                      color: const Color(0xffFC9340),
                      fontSize: height / 55,
                      fontFamily: 'GilroyBold',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 25)
          ],
        ),
      ),
    );
  }
}
