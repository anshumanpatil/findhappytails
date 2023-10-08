import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  //late ColorNotifier notifier;
  // late bool isUserLoggedIn;
  // checkLoginStatus() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString("token");
  //   print("SharedPreferences token ${token}");
  //   if (token == null) {
  //     isUserLoggedIn = false;
  //   } else {
  //     isUserLoggedIn = true;
  //   }
  // }

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
    // checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 8),
            Center(
              child: Image.asset("assets/loginsignselectlogo.png",
                  height: height / 3),
            ),
            SizedBox(height: height / 15),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/SignIn');
              },
              child: button(
                LanguageEn.continueswithgoogle,
                width / 1.1,
                const Color(0xffFC9340),
                const Color(0xfffbf0e8),
                const Color(0xffFC9340),
                "assets/googlelogo.png",
                buttoncolor,
              ),
            ),
            SizedBox(height: height / 45),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/SignIn');
              },
              child: button(
                LanguageEn.continueswithfacebook,
                width / 1.1,
                const Color(0xffFC9340),
                const Color(0xfffbf0e8),
                const Color(0xffFC9340),
                "assets/facebooklogo.png",
                const Color(0xffFC9340),
              ),
            ),
            SizedBox(height: height / 45),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/SignIn');
              },
              child: button(
                LanguageEn.registerwithemail,
                width / 1.1,
                const Color(0xffFC9340),
                Colors.transparent,
                const Color(0xffFC9340),
                "assets/email.png",
                const Color(0xffFC9340),
              ),
            ),
            SizedBox(height: height / 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LanguageEn.alredyhaveanacount,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/SignIn');
                  },
                  child: Text(
                    LanguageEn.signin,
                    style: TextStyle(
                      color: const Color(0xffFC9340),
                      fontSize: height / 55,
                      fontFamily: 'GilroyBold',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget button(text, w, bordercolor, bcolor, textcolor, image, imagecolor) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: bordercolor, width: 1.5),
          color: bcolor,
          borderRadius: const BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        height: height / 17,
        width: w,
        child: Row(
          children: [
            SizedBox(width: width / 15),
            Image.asset(image, height: height / 30, color: imagecolor),
            SizedBox(width: width / 25),
            Text(
              text,
              style: TextStyle(
                color: textcolor,
                fontSize: height / 45,
                fontFamily: 'GilroyBold',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
