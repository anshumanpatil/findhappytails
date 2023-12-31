import 'package:flutter/material.dart';
import 'package:findhappytails/loream.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/enstring.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    // getdarkmodepreviousstate();
  }
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
  Widget build(BuildContext context) {
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 14),
            Row(
              children: [
                SizedBox(width: width / 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back,
                      size: height / 30, color:  const Color(0xffFC9340)),
                ),
                SizedBox(width: width / 3.1),
                Text(
                  LanguageEn.setting,
                  style: TextStyle(color: Colors.black,
                    fontSize: height / 40,
                    fontFamily: 'GilroyBold',
                  ),
                )
              ],
            ),
            SizedBox(height: height / 20),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Notif');
                },
                child: settingoption("Notifications")),
            SizedBox(height: height / 20),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>   const Loream("Privacy Policy"),
                    ),
                  );
                },
                child: settingpolecy()),
            SizedBox(height: height / 20),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/FAQ');
                },
                child: settingoption("FAQ")),
          ],
        ),
      ),
    );
  }

  Widget settingoption(name) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 13),
          Text(
            name,
            style:   TextStyle(
                fontFamily: 'Gilroy_Medium', fontSize: 17, color: Colors.black),
          ),
          const Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 17),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }

  Widget settingpolecy() {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          SizedBox(width: width / 13),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              Text(
                "Privacy Policy",
                style: TextStyle(
                    fontFamily: 'Gilroy_Medium',
                    fontSize: 17,
                    color: Colors.black),
              ),
              Text(
                "Choose what data you share with us",
                style: TextStyle(
                    fontFamily: 'Gilroy_Medium',
                    fontSize: 13,
                    color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
            Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 17),
          SizedBox(width: width / 20),
        ],
      ),
    );
  }
}
