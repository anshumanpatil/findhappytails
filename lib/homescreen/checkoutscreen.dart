import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../custtomscreen/button.dart';
import '../utils/enstring.dart';
import '../utils/mediaqury.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectedindex = 0;
  int _groupValue = 0;
  int selected = 1;
  bool star = false;
  bool star1 = false;
  bool star2 = false;
  bool star3 = false;
  bool star4 = false;
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
            SizedBox(height: height / 14),
            Row(
              children: [
                SizedBox(width: width / 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selected >= 2) {
                        selected--;
                      } else {
                        selected;
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: Icon(Icons.arrow_back,
                      size: height / 30, color:  notifier.getbuttoncolor,),
                ),
              ],
            ),
            SizedBox(height: height / 40),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.checkout,
                  style: TextStyle(
                    color: notifier.getblack,
                    fontFamily: 'GilroyBold',
                    fontSize: height / 25,
                  ),
                )
              ],
            ),
            SizedBox(height: height / 100),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.pleasefinishyourpayment,
                  style: TextStyle(
                    color: notifier.getgreay,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 45,
                  ),
                )
              ],
            ),
            SizedBox(height: height / 50),
            Padding(
              padding: EdgeInsets.only(left: width / 20, right: width / 20),
              child: Container(
                color: Colors.transparent,
                height: height / 50,
                width: width,
                child: StepProgressIndicator(
                  size: height / 110,
                  totalSteps: 3,
                  currentStep: selected,
                  selectedColor: buttoncolor,
                  unselectedColor: const Color(0xffe5e5e5),
                ),
              ),
            ),
            SizedBox(height: height / 25),
            selected == 1
                ? Column(
                    children: [
                      adressbox(
                          LanguageEn.taylorstreet, LanguageEn.whiteplains, 0),
                      SizedBox(height: height / 50),
                      adressbox(LanguageEn.sycamorestreet,
                          LanguageEn.liberycenter, 1),
                      SizedBox(height: height / 50),
                      adressbox(LanguageEn.goodwinavenue,
                          LanguageEn.millwoodwashington, 2),
                      SizedBox(height: height / 50),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/AddNewAddress');
                        },
                        child: Container(
                          height: height / 11,
                          width: width / 1.1,
                          decoration:   BoxDecoration(
                            color:  notifier.getbuttoncolor.withOpacity(0.10),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,
                                    size: height / 30, color: notifier.getbuttoncolor,),
                                SizedBox(width: width / 50),
                                Text(
                                  LanguageEn.addnewaddress,
                                  style: TextStyle(
                                    color:  notifier.getbuttoncolor,
                                    fontSize: height / 50,
                                    fontFamily: 'GilroyMedium',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height / 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selected <= 2) {
                              selected++;
                            } else {
                              selected;
                            }
                          });
                        },
                        child: Custombutton.button(
                          LanguageEn.next,
                          width / 1.1,
                          Colors.transparent,
                          notifier.getbuttoncolor,
                          notifier.getwihite,
                        ),
                      ),
                    ],
                  )
                : selected == 2
                    ? Column(
                        children: [
                          paymentbox("Credit Card****9090", "Wendi Valerie", 0),
                          SizedBox(height: height / 50),
                          paymentbox("Credit Card****8564", "Wendi Valerie", 1),
                          SizedBox(height: height / 50),
                          Container(
                            height: height / 11,
                            width: width / 1.1,
                            decoration:   BoxDecoration(
                              color: notifier.getbuttoncolor.withOpacity(0.10),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(14),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add,
                                      size: height / 30, color:  notifier.getbuttoncolor,),
                                  SizedBox(width: width / 50),
                                  Text(
                                    LanguageEn.addnewpayment,
                                    style: TextStyle(
                                      color: buttoncolor,
                                      fontSize: height / 50,
                                      fontFamily: 'GilroyMedium',
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height / 5.6),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selected <= 2) {
                                  selected++;
                                } else {
                                  selected;
                                }
                              });
                            },
                            child: Custombutton.button(
                              LanguageEn.next,
                              width / 1.1,
                              Colors.transparent,
                              notifier.getbuttoncolor,
                              notifier.getwihite,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: width / 20),
                              Text(
                                LanguageEn.shippingaddress,
                                style: TextStyle(
                                  color: notifier.getgreay,
                                  fontSize: height / 50,
                                  fontFamily: 'GilroyMedium',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height / 60),
                          adressbox(LanguageEn.taylorstreet,
                              LanguageEn.whiteplains, 0),
                          SizedBox(height: height / 50),
                          Row(
                            children: [
                              SizedBox(width: width / 20),
                              Text(
                                LanguageEn.paymentmethod,
                                style: TextStyle(
                                  color: notifier.getgreay,
                                  fontSize: height / 50,
                                  fontFamily: 'GilroyMedium',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height / 60),
                          paymentbox("Credit Card****9090", "Wendi Valerie", 1),
                          SizedBox(height: height / 50),
                          Row(
                            children: [
                              SizedBox(width: width / 20),
                              Text(
                                LanguageEn.orderdetails,
                                style: TextStyle(
                                  color: notifier.getgreay,
                                  fontSize: height / 50,
                                  fontFamily: 'GilroyMedium',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height / 60),
                          Container(
                            height: height / 3,
                            width: width / 1.1,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffE0E0E0),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(width: width / 50),
                                        Image.asset("assets/pet4.png",height: height/12),
                                        SizedBox(width: width / 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: height / 32),
                                            Text(
                                              LanguageEn.elephantdoll,
                                              style: TextStyle(color: notifier.getblack,
                                                fontSize: height / 50,
                                                fontFamily: 'GilroyBold',
                                              ),
                                            ),
                                            SizedBox(height: height / 200),
                                            Text(
                                              "x1",
                                              style: TextStyle(
                                                color: notifier.getgreay,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          "\$54.75",
                                          style: TextStyle(
                                            fontFamily: 'GilroyBold',
                                            color: notifier.getgreay,
                                            fontSize: height / 50,
                                          ),
                                        ),
                                        SizedBox(width: width / 20),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                    color: Color(0xffE0E0E0), thickness: 1),
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(width: width / 50),
                                        Image.asset("assets/pet1.png",height: height/12),
                                        SizedBox(width: width / 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: height / 40),
                                            Text(
                                              LanguageEn.petheadcap,
                                              style: TextStyle(color: notifier.getblack,
                                                fontSize: height / 50,
                                                fontFamily: 'GilroyBold',
                                              ),
                                            ),
                                            SizedBox(height: height / 200),
                                            Text(
                                              "x1",
                                              style: TextStyle(
                                                color: notifier.getgreay,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          "\$12.50",
                                          style: TextStyle(
                                            fontFamily: 'GilroyBold',
                                            color: notifier.getgreay,
                                            fontSize: height / 50,
                                          ),
                                        ),
                                        SizedBox(width: width / 20),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(
                                    color: Color(0xffE0E0E0), thickness: 1),
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        SizedBox(width: width / 50),
                                        Image.asset("assets/pet2.png",height: height/12),
                                        SizedBox(width: width / 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: height / 50),
                                            Text(
                                              LanguageEn.doggreysweter,
                                              style: TextStyle(color: notifier.getblack,
                                                fontSize: height / 50,
                                                fontFamily: 'GilroyBold',
                                              ),
                                            ),
                                            SizedBox(height: height / 200),
                                            Text(
                                              "x1",
                                              style: TextStyle(
                                                color: notifier.getgreay,
                                                fontSize: height / 50,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          "\$35.00",
                                          style: TextStyle(
                                            fontFamily: 'GilroyBold',
                                            color: notifier.getgreay,
                                            fontSize: height / 50,
                                          ),
                                        ),
                                        SizedBox(width: width / 20),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height / 50),
                          GestureDetector(
                            onTap: () {
                              _showMyDialog();
                            },
                            child: Container(
                              height: height / 11,
                              width: width / 1.1,
                              decoration:   BoxDecoration(
                                color:  notifier.getbuttoncolor.withOpacity(0.10),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.discount,
                                        size: height / 30, color:  notifier.getbuttoncolor,),
                                    SizedBox(width: width / 50),
                                    Text(
                                      LanguageEn.havepromocode,
                                      style: TextStyle(
                                        color:  notifier.getbuttoncolor,
                                        fontSize: height / 50,
                                        fontFamily: 'GilroyMedium',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height / 18),
                          totalpayment(LanguageEn.subtotal, "\$102.25"),
                          SizedBox(height: height / 100),
                          totalpayment(LanguageEn.shipping, "\$9.00"),
                          SizedBox(height: height / 100),
                          totalpayment(LanguageEn.tax, "\$2.04"),
                          SizedBox(height: height / 70),
                          Row(
                            children: [
                              SizedBox(width: width / 20),
                              Text(
                                LanguageEn.grandtotal,
                                style: TextStyle(
                                    fontSize: height / 45,
                                    color: notifier.getblack,
                                    fontFamily: 'GilroyBold'),
                              ),
                              const Spacer(),
                              Text(
                                "\$113.29",
                                style: TextStyle(
                                    fontSize: height / 45,
                                    color: notifier.getblack,
                                    fontFamily: 'GilroyBold'),
                              ),
                              SizedBox(width: width / 20),
                            ],
                          ),
                          SizedBox(height: height / 30),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/Succsess');
                            },
                            child: Custombutton.button(
                              LanguageEn.confirmorder,
                              width / 1.1,
                              Colors.transparent,
                              notifier.getbuttoncolor,
                              notifier.getwihite,
                            ),
                          ),
                        ],
                      ),
            SizedBox(height: height / 30),
          ],
        ),
      ),
    );
  }

  _showMyDialog() async {
    return showDialog(
      context: context, useRootNavigator: true,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: notifier.getcardcolor,
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                color: notifier.getcardcolor,
                height: height / 3.8,
                // width: width / 1.1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.cancel,
                            size: height / 35,
                            color: notifier.getgreay,
                          ),
                        ),
                        SizedBox(width: width / 7),
                        Text(
                          LanguageEn.promocode,
                          style: TextStyle(
                            color: notifier.getblack,
                            fontFamily: 'GilroyBold',
                            fontSize: height / 50,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 25),
                    Container(
                      width: width / 1.1,
                      color: Colors.transparent,
                      height: height / 15,
                      child: TextField(
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: LanguageEn.enterpromocodehere,
                          suffixIcon: const Icon(Icons.discount),
                          hintStyle: TextStyle(color: notifier.getgreay),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Color(0xffE0E0E0),),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Color(0xffE0E0E0),),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

                      },
                      child: Custombutton.button(
                        LanguageEn.apply,
                        width / 1.1,
                        Colors.transparent,
                        notifier.getbuttoncolor,
                        notifier.getwihite,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        );
      },
    );
  }

  Widget totalpayment(title, price) {
    return Row(
      children: [
        SizedBox(width: width / 20),
        Text(
          title,
          style: TextStyle(
              fontSize: height / 45, color: notifier.getgreay, fontFamily: 'GilroyMedium'),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyle(
              fontSize: height / 45, color: notifier.getgreay, fontFamily: 'GilroyMedium'),
        ),
        SizedBox(width: width / 20),
      ],
    );
  }

  Widget adressbox(name, subname, val) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _groupValue = val as int;
          },
        );
      },
      child: Container(
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
                    color: notifier.getgreay,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
                SizedBox(height: height / 150),
                Text(
                  subname,
                  style: TextStyle(
                    color: notifier.getgreay,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Radio(
              activeColor: buttoncolor,
              value: val as int,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value as int;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentbox(name, subname, val) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _groupValue = val as int;
          },
        );
      },
      child: Container(
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
                    color: notifier.getblack,
                    fontSize: height / 48,
                    fontFamily: 'GilroyBold',
                  ),
                ),
                SizedBox(height: height / 150),
                Text(
                  subname,
                  style: TextStyle(
                    color: notifier.getgreay,
                    fontSize: height / 55,
                    fontFamily: 'GilroyMedium',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Radio(
              activeColor: notifier.getbuttoncolor,
              value: val as int,
              groupValue: _groupValue,
              onChanged: (value) {
                setState(() {
                  _groupValue = value as int;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
