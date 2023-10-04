import 'package:flutter/material.dart';
import 'package:findhappytails/custtomscreen/appbar.dart';
import 'package:findhappytails/custtomscreen/button.dart';
import 'package:findhappytails/custtomscreen/passwordcusttomtextfild.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custtomscreen/textfild.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifier.setIsDark = false;
    } else {
      notifier.setIsDark = previusstate;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdarkmodepreviousstate();
  }
  late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihite,
      appBar: CustomAppBar( LanguageEn.signin),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.loginwithyouraccount,
                  style: TextStyle(
                    color:  notifier.getgreay,
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
                    color: notifier.getgreay,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 100),
            CustoomTextfild(LanguageEn.emailaddress),
            SizedBox(height: height / 70),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.password,
                  style: TextStyle(
                    color: notifier.getgreay,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 100),
            PasswordCustoomTextfild(LanguageEn.password),
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
                      color: notifier.getbuttoncolor,
                      fontFamily: 'GilroyBold',
                      fontSize: height / 50,
                    ),
                  ),
                )
              ],
            ),
          SizedBox(height: height/3.3),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Bottomhome');
              },
              child: Custombutton.button(
                LanguageEn.login,
                width / 1.1,
                Colors.transparent,
                notifier.getbuttoncolor,
                notifier.getwihite,
              ),
            ),
            SizedBox(height: height / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LanguageEn.donthaveanaccountyet,
                  style: TextStyle(
                    color: notifier.getblack,
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
                      color:  notifier.getbuttoncolor,
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
