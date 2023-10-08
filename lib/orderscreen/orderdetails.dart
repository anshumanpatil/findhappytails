import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/mediaqury.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
      backgroundColor: Colors.white,

    );
  }

  Widget totalpayment(title, price) {
    return Row(
      children: [
        SizedBox(width: width / 20),
        Text(
          title,
          style: TextStyle(
              fontSize: height / 45, color: Colors.grey, fontFamily: 'GilroyMedium'),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
              fontSize: height / 45, color: Colors.grey, fontFamily: 'GilroyMedium'),
        ),
        SizedBox(width: width / 20),
      ],
    );
  }

  Widget paymentbox(name, subname) {
    return Container(
      height: height / 11,
      width: width / 1.1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        border: Border.all(
          color: const Color(0xffE0E0E0),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: width / 25),
          Image.asset("assets/logocard.png", height: height / 23),
          SizedBox(width: width / 23),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 60),
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height / 48,
                  fontFamily: 'GilroyBold',
                ),
              ),
              SizedBox(height: height / 150),
              Text(
                subname,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: height / 55,
                  fontFamily: 'GilroyMedium',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget adressbox(name, subname) {
    return Container(
      height: height / 11,
      width: width / 1.1,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        border: Border.all(
          color: const Color(0xffE0E0E0),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: width / 23),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 60),
              Text(
                name,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: height / 55,
                  fontFamily: 'GilroyMedium',
                ),
              ),
              SizedBox(height: height / 150),
              Text(
                subname,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: height / 55,
                  fontFamily: 'GilroyMedium',
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
