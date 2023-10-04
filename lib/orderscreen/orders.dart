import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  int selectedindex = 0;
  List tabsname = [
    LanguageEn.shopping,
    LanguageEn.adoptions,
    LanguageEn.treatment,
  ];
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
          SizedBox(height: height / 17),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.order,
                style:
                    TextStyle(fontFamily: 'GilroyBold', fontSize: height / 30,color: notifier.getblack),
              ),
            ],
          ),
          SizedBox(height: height / 40),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.listyourallorders,
                style: TextStyle(
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 50,
                    color: notifier.getgreay),
              ),
            ],
          ),
          Container(
            color: Colors.transparent,
            height: height / 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                      });
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height / 23,
                            width: width / 3.65,
                            decoration: BoxDecoration(
                              color: selectedindex == index
                                  ?     notifier.getbuttoncolor
                                  :     notifier.getbuttoncolor.withOpacity(0.10),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                tabsname[index].toString(),
                                style: TextStyle(
                                    color: selectedindex == index
                                        ? notifier.getwihite
                                        :     notifier.getbuttoncolor,
                                    fontSize: height / 53,
                                    fontFamily: 'GilroyBold'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          selectedindex == 0
              ? Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        adressbox("#1234319889", LanguageEn.processingorder,
                            LanguageEn.october, "\$54.75", "3 items"),
                        SizedBox(height: height / 45),
                        adressbox("#5421241244", LanguageEn.processingorder,
                            "October 10, 2020", "\$102.24", "5 items"),
                        SizedBox(height: height / 45),
                        adressbox("#9098834543", LanguageEn.processingorder,
                            "November 30, 2020", "\$14.75", "1 items"),
                      ],
                    ),
                  ),
                )
              : selectedindex == 1
                  ? Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            adressbox("#1234319889", LanguageEn.processingorder,
                                LanguageEn.october, "\$54.75", "3 items"),
                            SizedBox(height: height / 45),
                            adressbox("#5421241244", LanguageEn.processingorder,
                                "October 10, 2020", "\$102.24", "5 items"),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            adressbox("#1234319889", LanguageEn.processingorder,
                                LanguageEn.october, "\$54.75", "3 items"),
                          ],
                        ),
                      ),
                    )
        ],
      ),
    );
  }

  Widget adressbox(name, subname, orderdate, price, iteams) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/OrderDetails');
      },
      child: Container(
        height: height / 9,
        width: width / 1.1,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          border: Border.all(color: const Color(0xffE0E0E0),),
        ),
        child: Row(
          children: [
            SizedBox(width: width / 23),
            Image.asset("assets/shopping.png", height: height / 15),
            SizedBox(width: width / 23),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height / 60),
                Text(
                  name,
                  style: TextStyle(
                    color: notifier.getgreay,
                    fontSize: height / 55,
                    fontFamily: 'GilroyBold',
                  ),
                ),
                SizedBox(height: height / 150),
                Text(
                  subname,
                  style: TextStyle(
                    color: notifier.getblack,
                    fontSize: height / 45,
                    fontFamily: 'GilroyBold',
                  ),
                ),
                SizedBox(height: height / 150),
                Text(
                  orderdate,
                  style: TextStyle(
                    color: notifier.getgreay,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: height / 100),
                Text(
                  price,
                  style: TextStyle(
                    color: notifier.getblack,
                    fontSize: height / 40,
                    fontFamily: 'GilroyBold',
                  ),
                ),
                Text(
                  iteams,
                  style: TextStyle(
                    color: notifier.getgreay,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
              ],
            ),
            SizedBox(width: width / 25),
          ],
        ),
      ),
    );
  }
}
