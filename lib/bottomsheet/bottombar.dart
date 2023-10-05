import 'package:flutter/material.dart';
import 'package:findhappytails/homescreen/home.dart';
import 'package:findhappytails/orderscreen/orders.dart';
import 'package:findhappytails/pets/pets.dart';
import 'package:findhappytails/user/user.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/enstring.dart';
import '../utils/mediaqury.dart';

class Bottomhome extends StatefulWidget {
  const Bottomhome({Key? key}) : super(key: key);

  @override
  _BottomhomeState createState() => _BottomhomeState();
}

class _BottomhomeState extends State<Bottomhome> {
  int _selectedIndex = 0;

  String? name;
  DateTime? currentBackPressTime;
  bool shouldPop = false;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     print(_selectedIndex);
  //   });
  // }
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
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final _pageOption = [
      const Home(),
      // const Orders(),
      const Pets(),
      const User()
    ];
    return Scaffold(backgroundColor: notifier.getwihite,
      restorationId: "123",
      bottomNavigationBar: SalomonBottomBar(
        selectedColorOpacity: 1,
        curve: Curves.decelerate,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        selectedItemColor: buttoncolor,
        currentIndex: _selectedIndex,
        items: [
          SalomonBottomBarItem(
            icon: Image.asset("assets/home.png",
                height: height / 40,
                color: _selectedIndex == 0 ? white : Colors.grey),
            title: Text(
              LanguageEn.home,
              style: TextStyle(
                  fontSize: height / 60,
                  color: Colors.white,
                  fontFamily: 'GilroyBold'),
            ),
            selectedColor: buttoncolor,
          ),
          // SalomonBottomBarItem(
          //     icon: Image.asset(
          //       "assets/orders.png",
          //       height: height / 40,
          //       color: _selectedIndex == 1 ? Colors.white : Colors.grey,
          //     ),
          //     title: Text(
          //       LanguageEn.order,
          //       style: TextStyle(
          //           fontSize: height / 60,
          //           color: Colors.white,
          //           fontFamily: 'GilroyBold'),
          //     ),
          //     selectedColor: buttoncolor),
          SalomonBottomBarItem(
            icon: Image.asset("assets/pets.png",
                height: height / 40,
                color: _selectedIndex == 1 ? Colors.white : Colors.grey),
            title: Text(
              LanguageEn.pets,
              style: TextStyle(
                  fontSize: height / 60,
                  color: Colors.white,
                  fontFamily: 'GilroyBold'),
            ),
            selectedColor: buttoncolor,
          ),
          SalomonBottomBarItem(
            icon: Image.asset("assets/user.png",
                height: height / 40,
                color: _selectedIndex == 2 ? Colors.white : Colors.grey),
            title: Text(
              LanguageEn.user,
              style: TextStyle(
                  fontSize: height / 60,
                  color: Colors.white,
                  fontFamily: 'GilroyBold'),
            ),
            selectedColor: buttoncolor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pageOption[_selectedIndex],
    );
  }
}
