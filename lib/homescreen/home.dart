import 'package:flutter/material.dart';
import 'package:findhappytails/custtomscreen/custtompolular.dart';
import 'package:findhappytails/homescreen/shoping.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List catogeryimagelist = [
    "assets/pet1.png",
    "assets/pet4.png",
    "assets/pet3.png",
    "assets/pet4.png",
  ];
  List shopcatogeryimagelist = [
    "assets/dogwalkers.png",
    "assets/petsitter.png",
    "assets/vet.png",
    "assets/dumbell.png",
    "assets/petstore.png",
    "assets/homes.png",
    "assets/camera.png",
    "assets/grooming.png",
  ];
  List catogerytext = [
    LanguageEn.shopping,
    LanguageEn.treatment,
    LanguageEn.pethotel,
    LanguageEn.adoptions,
    LanguageEn.adoptions,
    LanguageEn.adoptions,
    LanguageEn.adoptions,
  ];

  List dogoffer = [
    "assets/latestoffersbanner1.png",
    "assets/latestoffersbanner2.png",
    // "assets/latestoffersbanner3.png",
    // "assets/latestoffersbanner1.png",
  ];

  List bestsellingitemtitle = [
    "Jackson",
    "Shelly",
    "Labrador",
    "American",
    "Specked",
  ];

  List bestsellingitemprice = [
    "Distance (5km)",
    "Distance (2km)",
    "Distance (8km)",
    "Distance (1.2km)",
    "Distance (5.8km)",
  ];

  List goodtoreadlist = [
    "assets/goodread.png",
    "assets/goodread.png",
    "assets/goodread.png",
    "assets/goodread.png",
  ];
  List dogsubnamewaitingforyou = [
    "Boston Terrier",
    "Cavalier King",
    "Cavalier Spaniel",
    "Cavalier",
  ];

  List waitingforyouyear = [
    "2 Years",
    "3 Years",
    "1 Years",
    "5 Years",
  ];

  List catogeryname = [
    "Dog walkers",
    "Pet sitter",
    "Vet",
    "Trainer",
    "Pet store",
    "Boarding",
    "Photography",
    "Grooming"
  ];

  List exploremoreimagelist = [
    "assets/emog1.png",
    "assets/emog2.png",
    "assets/emog3.png",
    "assets/emog4.png",
  ];
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
late ColorNotifier notifier;
  @override
  Widget build(BuildContext context) {
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: notifier.getwihite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 17),
            // Row(
            //   children: [
            //     const Spacer(),
            //     Icon(Icons.shopping_basket,
            //         size: height / 35, color: buttoncolor),
            //     SizedBox(width: width / 20),
            //   ],
            // ),
            // Row(
            //   children: [
            //     SizedBox(width: width / 20),
            //     Text(
            //       LanguageEn.hello,
            //       style: TextStyle(
            //         color: notifier.getblack,
            //         fontFamily: 'GilroyBold',
            //         fontSize: height / 25,
            //       ),
            //     ),
            //     SizedBox(width: width / 50),
            //     Text(
            //       LanguageEn.wendi,
            //       style: TextStyle(
            //         color:  notifier.getbuttoncolor,
            //         fontFamily: 'GilroyBold',
            //         fontSize: height / 25,
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(height: height / 30),
            // Row(
            //   children: [
            //     SizedBox(width: width / 20),
            //     Text(
            //       LanguageEn.whatareyoulookingfor,
            //       style: TextStyle(
            //         color: notifier.getgreay,
            //         fontFamily: 'GilroyMedium',
            //         fontSize: height / 45,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 22),
            const SizedBox(),
            // catogery(),
            // SizedBox(height: height / 60),
            // Row(
            //   children: [
            //     SizedBox(width: width / 20),
            //     Text(
            //       LanguageEn.latestoffers,
            //       style: TextStyle(
            //         color: notifier.getblack,
            //         fontFamily: 'GilroyBold',
            //         fontSize: height / 35,
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(height: height / 50),
            // doglatestoffers(),
            // SizedBox(height: height / 30),
            // Row(
            //   children: [
            //     SizedBox(width: width / 20),
            //     Text(
            //       LanguageEn.exploremoreongopet,
            //       style: TextStyle(
            //         color: notifier.getblack,
            //         fontFamily: 'GilroyBold',
            //         fontSize: height / 35,
            //       ),
            //     )
            //   ],
            // ),
            // SizedBox(height: height / 80),
            // exploremoreongopet(),
            // SizedBox(height: height / 30),
            // Row(
            //   children: [
            //     SizedBox(width: width / 20),
            //     Text(
            //       LanguageEn.bestselingitem,
            //       style: TextStyle(
            //         color: notifier.getblack,
            //         fontFamily: 'GilroyBold',
            //         fontSize: height / 35,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 60),
            // bestsellingitem(),
            // SizedBox(height: height / 45),
            // Row(
            //   children: [
            //     SizedBox(width: width / 20),
            //     Text(
            //       LanguageEn.waitingforyou,
            //       style: TextStyle(
            //         color: notifier.getblack,
            //         fontFamily: 'GilroyBold',
            //         fontSize: height / 35,
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: height / 50),
            // waitingforyouitem(),
            // SizedBox(height: height / 30),
            // Row(
            //   children: [
            //     SizedBox(width: width / 20),
            //     Text(
            //       LanguageEn.popular,
            //       style: TextStyle(
            //         color: notifier.getblack,
            //         fontFamily: 'GilroyBold',
            //         fontSize: height / 35,
            //       ),
            //     ),
            //     const Spacer(),
            //     GestureDetector(
            //       onTap: () {
            //         Navigator.pushNamed(context, '/ViewAll');
            //       },
            //       child: Text(
            //         LanguageEn.viewall,
            //         style: TextStyle(
            //           color: notifier.getgreay,
            //           fontFamily: 'GilroyMedium',
            //           fontSize: height / 55,
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: width / 20),
            //   ],
            // ),
            SizedBox(height: height / 50),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/Adopt');
              },
              child: const CusttomPopular(),
            )

            // const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget catogery() {
    return Container(
      color: Colors.transparent,
      height: height / 10,
      width: width / 1.1,
      child: ListView.builder(
        itemCount: shopcatogeryimagelist.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: width / 60),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Shoping(),
                        ),
                      );
                    } else if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Shoping(),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Shoping(),
                        ),
                      );
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Shoping(),
                        ),
                      );
                    } else if (index == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Shoping(),
                        ),
                      );
                    } else if (index == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Shoping(),
                        ),
                      );
                    } else if (index == 6) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Shoping(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: height / 15,
                    width: width / 2.3,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? const Color(0xfffbf0e8)
                          : index == 1
                              ? const Color(0xffd1eaf7)
                              : index == 2
                                  ? const Color(0xffffece6)
                                  : index == 3
                                      ? const Color(0xffffe8d2)
                                      : index == 4
                                          ? const Color(0xffc5dfe5)
                                          : index == 5
                                              ? const Color(0xffeee9fb)
                                              : index == 6
                                                  ? const Color(0xffffeabd)
                                                  : const Color(0xffd2f1db),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                      // border: Border.all(color: const Color(0xffE0E0E0)),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: width / 45),
                          Container(
                            height: height / 20,
                            width: width / 9,
                            decoration: BoxDecoration(
                              color: notifier.getwihite,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(shopcatogeryimagelist[index],color: notifier.getblack,
                                  height: height / 40),
                            ),
                          ),
                          SizedBox(width: width / 35),
                          Expanded(
                            child: Text(
                              catogeryname[index],
                              style: TextStyle(color: Colors.black,
                                fontSize: height / 55,
                                fontFamily: 'GilroyBold',
                              ),
                            ),
                          ),
                          SizedBox(width: width / 50),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget exploremoreongopet() {
    return Container(color: Colors.transparent,
      height: height / 5.2,
      width: width / 1.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: exploremoreimagelist.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 40),
                child: Container(
                  color: Colors.transparent,
                  height: height / 6.5,
                  width: width / 1.7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      exploremoreimagelist[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget doglatestoffers() {
    return Container(
      color: Colors.transparent,
      height: height / 5.2,
      width: width / 1.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dogoffer.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: width / 40),
                child: Container(
                  color: Colors.transparent,
                  height: height / 5,
                  width: width / 1.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      dogoffer[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget waitingforyouitem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Adopt');
      },
      child: Container(
        color: Colors.transparent,
        height: height / 3,
        width: width / 1.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: catogeryimagelist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: height / 2,
                width: width / 2,
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
                    SizedBox(height: height / 80),
                    Container(
                      height: height / 5.2,
                      width: width / 2.4,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(catogeryimagelist[index],
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: height / 70),
                    Row(
                      children: [
                        SizedBox(width: width / 25),
                        Text(
                          bestsellingitemtitle[index],
                          style: TextStyle(
                            color: notifier.getblack,
                            fontSize: height / 55,
                            fontFamily: 'GilroyBold',
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.animation,
                            size: height / 50, color: Colors.lightBlueAccent),
                        SizedBox(width: width / 15),
                      ],
                    ),
                    SizedBox(height: height / 200),
                    Row(
                      children: [
                        SizedBox(width: width / 25),
                        Text(
                          dogsubnamewaitingforyou[index],
                          style: TextStyle(
                            color: notifier.getgreay,
                            fontSize: height / 55,
                            fontFamily: 'GilroyBold',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 200),
                    Row(
                      children: [
                        SizedBox(width: width / 25),
                        Text(
                          waitingforyouyear[index],
                          style: TextStyle(
                            color: notifier.getgreay,
                            fontSize: height / 55,
                            fontFamily: 'GilroyBold',
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.favorite,
                            size: height / 50, color: Colors.redAccent),
                        SizedBox(width: width / 25),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget bestsellingitem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/Adopt');
      },
      child: Container(
        color: Colors.transparent,
        height: height / 3,
        width: width / 1.1,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: catogeryimagelist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.5),
              child: Container(
                height: height / 3,
                width: width / 2,
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
                    SizedBox(height: height / 50),
                    Container(
                      height: height / 5,
                      width: width / 2.4,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(catogeryimagelist[index],
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(height: height / 70),
                    Row(
                      children: [
                        SizedBox(width: width / 25),
                        Text(
                          bestsellingitemtitle[index],
                          style: TextStyle(
                            color: notifier.getblack,
                            fontSize: height / 55,
                            fontFamily: 'GilroyBold',
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.favorite,
                          size: height / 50,
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: width / 15),
                      ],
                    ),
                    SizedBox(height: height / 200),
                    Row(
                      children: [
                        SizedBox(width: width / 25),
                        Icon(Icons.location_on_outlined,
                            size: height / 45, color: Colors.redAccent),
                        SizedBox(width: width / 80),
                        Text(
                          bestsellingitemprice[index],
                          style: TextStyle(
                            color: notifier.getgreay,
                            fontSize: height / 55,
                            fontFamily: 'GilroyBold',
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget goodtoread() {
    return Container(
      color: Colors.transparent,
      height: height / 3,
      width: width / 1.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: goodtoreadlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                goodtoreadlist[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
