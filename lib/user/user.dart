
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:findhappytails/loream.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {


  late ColorNotifier notifier;
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
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 2.5,
              width: width,
              decoration: BoxDecoration(
                color: buttoncolor.withOpacity(0.10),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: height / 20),
                  Row(
                    children: [
                      SizedBox(width: width / 2.5),
                      Text(
                        LanguageEn.profile,
                        style: TextStyle(color: notifier.getblack,
                          fontFamily: 'GilroyBold',
                          fontSize: height / 35,
                        ),
                      ),
                      SizedBox(width: width / 6),
                      Icon(
                        Icons.edit,
                        size: height / 40,
                        color: const Color(0xfff36a3f),
                      ),
                      SizedBox(width: width / 70),
                      Text(
                        LanguageEn.edit,
                        style: TextStyle(
                          color: const Color(0xfff36a3f),
                          fontSize: height / 50,
                          fontFamily: 'GilroyMedium',
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height / 25),
                  Image.asset("assets/profile.png", height: height / 6.5),
                  SizedBox(height: height / 50),
                  Text(
                    LanguageEn.leilasans,
                    style: TextStyle(
                      color: notifier.getblack,
                      fontSize: height / 30,
                      fontFamily: 'GilroyBold',
                    ),
                  ),
                  // SizedBox(height: height/100),
                  Text(
                    LanguageEn.kiev,
                    style: TextStyle(
                      color: notifier.getbuttoncolor,
                      fontSize: height / 50,
                      fontFamily: 'GilroyMedium',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 35),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Pets');
              },
              child: profiletype(LanguageEn.mypets, "assets/Heart.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: const Divider(color: Color(0xffE0E0E0)),
            ),
            GestureDetector(
              onTap: () {
                share();
              },
              child: profiletype(LanguageEn.invitefriend, "assets/AddUser.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: const Divider(
                color: Color(0xffE0E0E0),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loream(LanguageEn.help),
                    ),
                  );
                },
                child: profiletype(LanguageEn.help, "assets/helps.png")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: const Divider(
                color: Color(0xffE0E0E0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Settings');
              },
              child: profiletype(LanguageEn.setting, "assets/Settings.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: const Divider(
                color: Color(0xffE0E0E0),
              ),
            ),
            darkmode(LanguageEn.darkmode),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: const Divider(
                color: Color(0xffE0E0E0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/SignIn');
              },
              child: profiletype(LanguageEn.logout, "assets/Logouts.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: const Divider(
                color: Color(0xffE0E0E0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  Widget profiletype(name, image) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 20),
          CircleAvatar(
            backgroundColor: notifier.getbuttoncolor.withOpacity(0.10),
            child: Image.asset(image,
                height: height / 40, color: notifier.getbuttoncolor),
          ),
          SizedBox(width: width / 50),
          Text(
            name,
            style: TextStyle(
              color: notifier.getblack,
              fontSize: height / 50,
              fontFamily: 'GilroyMedium',
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: height / 40,
            color: const Color(0xffE0E0E0),
          ),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }

  Widget darkmode(name) {
    return Container(
      color: Colors.transparent,

    );
  }
}
