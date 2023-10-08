import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custtomscreen/appbar.dart';
import '../custtomscreen/button.dart';
import '../custtomscreen/passwordcusttomtextfild.dart';
import '../custtomscreen/textfild.dart';
import '../utils/enstring.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

bool isChecked = false;

class _RegisterState extends State<Register> {
  //late ColorNotifier notifier;
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
  @override
  Widget build(BuildContext context) {
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: CustomAppBar(  LanguageEn.register),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.createanaccounttostart,
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
                  LanguageEn.name,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 100),
            CustoomTextfild(LanguageEn.yourfullname),
            SizedBox(height: height / 70),
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
            SizedBox(height: height / 200),
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
            PasswordCustoomTextfild(LanguageEn.password),
            SizedBox(height: height / 200),
            Text(
              LanguageEn.passwordmustcontainsofcharacter,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'GilroyMedium',
                fontSize: height / 58,
              ),
            ),
            SizedBox(height: height / 70),
            Row(
              children: [
                Transform.scale(
                  scale: 1,
                  child: Checkbox(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    activeColor:  const Color(0xffFC9340),
                    side: BorderSide(color:  const Color(0xffFC9340),),
                    value: isChecked,
                    splashRadius: 1,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          LanguageEn.bysigningupiagreetothe,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height / 62,
                              fontFamily: 'GilroyMedium'),
                        ),
                        Text(
                          LanguageEn.termcondition,
                          style: TextStyle(
                              color:  const Color(0xffFC9340),
                              fontSize: height / 62,
                              fontFamily: 'GilroyMedium'),
                        ),
                        Text(
                          LanguageEn.and,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: height / 62,
                              fontFamily: 'GilroyMedium'),
                        ),
                      ],
                    ),
                    Text(
                      LanguageEn.privacypolicy,
                      style: TextStyle(
                          color:  const Color(0xffFC9340),
                          fontSize: height / 62,
                          fontFamily: 'GilroyMedium'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height / 10),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Bottomhome');
              },
              child: Custombutton.button(
                LanguageEn.createaccount,
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
                  LanguageEn.alredyhaveanacount,
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
                    LanguageEn.signin,
                    style: TextStyle(
                      color:  const Color(0xffFC9340),
                      fontSize: height / 55,
                      fontFamily: 'GilroyBold',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
