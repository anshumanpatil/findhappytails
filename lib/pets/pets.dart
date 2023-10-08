import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/colors.dart';
import '../utils/enstring.dart';
import '../utils/mediaqury.dart';

class Pets extends StatefulWidget {
  const Pets({Key? key}) : super(key: key);

  @override
  State<Pets> createState() => _PetsState();
}

class _PetsState extends State<Pets> {
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
      body: Column(
        children: [
          SizedBox(height: height / 17),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.pets,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'GilroyBold',
                  fontSize: height / 25,
                ),
              )
            ],
          ),
          SizedBox(height: height / 50),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.listbioof,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'GilroyMedium',
                  fontSize: height / 45,
                ),
              )
            ],
          ),
          SizedBox(height: height / 40),
          pets(LanguageEn.charlie, LanguageEn.miniature, "Dog", width / 13,
              "3 Month", "Male", "2.5kg", "assets/petdog1.png"),
          SizedBox(height: height / 50),
          pets(LanguageEn.suzy, LanguageEn.mainecoon, "Cat", width / 5,
              "2 Years", "FeMale", "3.2kg", "assets/petdog2.png"),
          SizedBox(height: height / 50),
          pets(LanguageEn.edward, LanguageEn.hollandlop, "Rabbit", width / 5,
              "2 Month", "Male", "1.5kg", "assets/petdog3.png"),
          SizedBox(height: height / 50),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/NewPet');
            },
            child: Container(
              height: height / 11,
              width: width / 1.1,
              decoration:   BoxDecoration(
                color:     const Color(0xffFC9340).withOpacity(0.10),
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: height / 30, color:     const Color(0xffFC9340)),
                    SizedBox(width: width / 50),
                    Text(
                      LanguageEn.addnewpet,
                      style: TextStyle(
                        color:     const Color(0xffFC9340),
                        fontSize: height / 50,
                        fontFamily: 'GilroyMedium',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pets(name, subname, buttonname, w, age, sex, weight, image) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/PetDetails');
      },
      child: Container(
        height: height / 6.2,
        width: width / 1.1,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: const Color(0xffE0E0E0),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: width / 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(image, height: height / 10),
            ),
            SizedBox(width: width / 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 80),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(color: Colors.black,
                            fontSize: height / 40,
                            fontFamily: 'GilroyBold',
                          ),
                        ),
                        Text(
                          subname,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: height / 50,
                            fontFamily: 'GilroyMedium',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: w),
                    Container(
                      height: height / 35,
                      width: width / 7,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(color: buttoncolor),
                      ),
                      child: Center(
                        child: Text(
                          buttonname,
                          style: TextStyle(
                            color:     const Color(0xffFC9340),
                            fontSize: height / 65,
                            fontFamily: 'GilroyMedium',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height / 45),
                Row(
                  children: [
                    agecarddetails(LanguageEn.age, age),
                    SizedBox(width: width / 50),
                    sexcarddetails(LanguageEn.sex, sex),
                    SizedBox(width: width / 50),
                    weightcarddetails(LanguageEn.weight, weight),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget agecarddetails(age, yr) {
    return Container(
      height: height / 20,
      width: width / 6,
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
              fontSize: height / 85,
              fontFamily: 'GilroyMedium',
            ),
          ),
          Text(
            yr,
            style: TextStyle(
              color: Colors.black,
              fontSize: height / 75,
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
      width: width / 6,
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
              fontSize: height / 85,
              fontFamily: 'GilroyMedium',
            ),
          ),
          Text(
            yr,
            style: TextStyle(
              color: Colors.black,
              fontSize: height / 75,
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
      width: width / 6,
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
              fontSize: height / 85,
              fontFamily: 'GilroyMedium',
            ),
          ),
          Text(
            yr,
            style: TextStyle(
              color: Colors.black,
              fontSize: height / 75,
              fontFamily: 'GilroyBold',
            ),
          ),
        ],
      ),
    );
  }
}
