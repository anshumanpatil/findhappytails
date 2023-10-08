import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({Key? key}) : super(key: key);

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {

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
    // //notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,

    );
  }

  Widget activities(image, title, subtitle) {
    return Container(
      height: height / 9,
      width: width / 1.1,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffE0E0E0),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(13),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: width / 38),
          Image.asset(image, height: height / 12),
          SizedBox(width: width / 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 40),
              Text(
                title,
                style:
                    TextStyle(fontFamily: 'GilroyBold', fontSize: height / 40,color: Colors.black),
              ),
              SizedBox(height: height / 300),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'GilroyMedium',
                  fontSize: height / 60,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget agecarddetails(age, yr) {
    return Container(
      height: height / 20,
      width: width / 3.5,
      decoration:   BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: buttoncolor.withOpacity(0.10),
      ),
      child: Column(
        children: [
          SizedBox(height: height / 200),
          Text(
            age,
            style: TextStyle(
              color: Colors.grey,
              fontSize: height / 70,
              fontFamily: 'GilroyMedium',
            ),
          ),
          Text(
            yr,
            style: TextStyle(
              color: Colors.black,
              fontSize: height / 60,
              fontFamily: 'GilroyBold',
            ),
          )
        ],
      ),
    );
  }

  Widget sexcarddetails(age, yr) {
    return Container(
      height: height / 20,
      width: width / 3.5,
      decoration:   BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: buttoncolor.withOpacity(0.10),
      ),
      child: Column(
        children: [
          SizedBox(height: height / 200),
          Text(
            age,
            style: TextStyle(
              color: Colors.grey,
              fontSize: height / 70,
              fontFamily: 'GilroyMedium',
            ),
          ),
          Text(
            yr,
            style: TextStyle(
              color: Colors.black,
              fontSize: height / 60,
              fontFamily: 'GilroyBold',
            ),
          )
        ],
      ),
    );
  }

  Widget weightcarddetails(age, yr) {
    return Container(
      height: height / 20,
      width: width / 3.5,
      decoration:   BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        color: buttoncolor.withOpacity(0.10),
      ),
      child: Column(
        children: [
          SizedBox(height: height / 200),
          Text(
            age,
            style: TextStyle(
              color: Colors.grey,
              fontSize: height / 70,
              fontFamily: 'GilroyMedium',
            ),
          ),
          Text(
            yr,
            style: TextStyle(
              color: Colors.black,
              fontSize: height / 60,
              fontFamily: 'GilroyBold',
            ),
          )
        ],
      ),
    );
  }
}
