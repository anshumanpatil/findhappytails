import 'package:flutter/material.dart';
import 'package:findhappytails/custtomscreen/button.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Succsess extends StatefulWidget {
  const Succsess({Key? key}) : super(key: key);

  @override
  State<Succsess> createState() => _SuccsessState();
}

class _SuccsessState extends State<Succsess> {
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
      body: Column(
        children: [
          SizedBox(height: height / 8),
          Center(
            child: Image.asset("assets/successfuly.png", height: height / 3.5),
          ),
          SizedBox(height: height / 10),
          Text(
            LanguageEn.youshippingorderhas,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: height / 33,
                fontFamily: 'GilroyBold',
                color: notifier.getblack),
          ),
          SizedBox(height: height / 13),
          Text(
            LanguageEn.thakyouforyouyrorder,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: notifier.getgreay,
                fontSize: height / 50,
                fontFamily: 'GilroyMedium'),
          ),
          SizedBox(height: height / 7),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Orders');
            },
            child: Custombutton.button(
              LanguageEn.gotomyorder,
              width / 1.1,
              notifier.getbuttoncolor,
              Colors.transparent,
              notifier.getbuttoncolor,
            ),
          ),
        ],
      ),
    );
  }
}
