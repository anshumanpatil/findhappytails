import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/mediaqury.dart';

class Adopt extends StatefulWidget {
  const Adopt({Key? key}) : super(key: key);

  @override
  State<Adopt> createState() => _AdoptState();
}

class _AdoptState extends State<Adopt> {


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
    // getdarkmodepreviousstate();
  }


  List interest = ["image/fitness.png", "image/cooking.png", "image/video.png"];
  late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihite,

    );
  }

  Widget allshedogbutton(color, image, txt) {
    return Container(
      height: height / 11,
      width: width / 4.9,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height / 70),
          Image.asset(image, height: height / 35),
          SizedBox(height: height / 80),
          Text(
            txt,
            style: TextStyle(fontSize: height / 60,
              fontFamily: 'GilroyMedium',
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget boomerbuttontype(year, subtitle) {
    return Container(
      height: height / 10,
      width: width / 3.5,
      decoration: BoxDecoration(
        color: buttoncolor.withOpacity(0.10),
        borderRadius: const BorderRadius.all(
          Radius.circular(17),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height / 45),
          Text(
            year,
            style: TextStyle(color: notifier.getblack,
              fontSize: height / 40,
              fontFamily: 'GilroyBold',
            ),
          ),
          const SizedBox(),
          Text(
            subtitle,
            style: TextStyle(
              color: notifier.getblack,
              fontSize: height / 50,
              fontFamily: 'GilroyMedium',
            ),
          )
        ],
      ),
    );
  }
}
