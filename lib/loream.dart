import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loream extends StatefulWidget {

  final String? titles;
  const  Loream(this.titles, {Key? key}) : super(key: key);

  @override
  State<Loream> createState() => _LoreamState();
}

class _LoreamState extends State<Loream> {
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
          SizedBox(height: height / 14),
          Row(
            children: [
              SizedBox(width: width / 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back,
                    size: height / 30, color: notifier.getbuttoncolor),
              ),
              const Spacer(),
              Text(
                widget.titles!,
                style: TextStyle(
                  color: notifier.getblack,
                  fontSize: height / 40,
                  fontFamily: 'GilroyBold',
                ),
              ),
              SizedBox(width: width / 2.3),
            ],
          ),
          SizedBox(height: height / 50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GilroyMedium',
                fontSize: height / 50,
                color: notifier.getblack,
              ),
            ),
          )
        ],
      ),
    );
  }
}
