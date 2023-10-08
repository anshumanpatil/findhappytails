import 'package:flutter/material.dart';
import 'package:findhappytails/custtomscreen/appbar.dart';
import 'package:findhappytails/custtomscreen/button.dart';
import 'package:findhappytails/custtomscreen/textfild.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
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
      appBar: CustomAppBar( LanguageEn.forgotpasswords),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.enteryouremailtoreset,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 35),
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
            CustoomTextfild(LanguageEn.emailaddress),
            SizedBox(height: height / 100),
            Text(
              LanguageEn.enteryourregisteredemail,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'GilroyMedium',
                fontSize: height / 55,
              ),
            ),
            SizedBox(height: height / 2.3),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Bottomhome');
              },
              child: Custombutton.button(
                LanguageEn.submit,
                width / 1.1,
                Colors.transparent,
                const Color(0xffFC9340),
                Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
