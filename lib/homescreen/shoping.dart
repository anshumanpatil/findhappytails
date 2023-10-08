import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shoping extends StatefulWidget {
  const Shoping({Key? key}) : super(key: key);

  @override
  State<Shoping> createState() => _ShopingState();
}

class _ShopingState extends State<Shoping> {
  int selectedindex = 0;
  String selected = '';
  List txt = [
    LanguageEn.all,
    LanguageEn.food,
    LanguageEn.shampoo,
  ];
  List catogeryimagelist = [
    "assets/pet1.png",
    "assets/pet2.png",
    "assets/pet3.png",
    "assets/pet4.png"
  ];

  List allbestsellingitemtitle = [
    LanguageEn.dogthirt,
    LanguageEn.enlephantdoll,
    LanguageEn.doggreysweter,
    LanguageEn.dogpinksweter,
    LanguageEn.petheadcap,
  ];
  List foodbestsellingitemtitle = [
    LanguageEn.dogthirt,
    LanguageEn.enlephantdoll,
    LanguageEn.doggreysweter,
  ];
  List shampoobestsellingitemtitle = [
    LanguageEn.dogthirt,
    LanguageEn.enlephantdoll,
  ];

  List bestsellingitemprice = [
    "\$15.50",
    "\$54.75",
    "\$35.00",
    "\$12.50",
    "\$20.50",
  ];
  List checkList2Items = [
    {
      "id": 0,
      "value": false,
      "title": LanguageEn.latestproducts,
    },
    {
      "id": 1,
      "value": false,
      "title": LanguageEn.bestselling,
    },
    {
      "id": 2,
      "value": false,
      "title": LanguageEn.lowprice,
    },
    {
      "id": 3,
      "value": false,
      "title": LanguageEn.highestprice,
    },
  ];
  final List brand = [
    "King",
    "Pedigree",
    "Baker",
    "Whiskies",
    "Chomp",
    "Pet Toys",
    "Meow",
    "Basche",
    "Domino"
  ];
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
  RangeValues _currentRangeValues = const RangeValues(20, 25);
  //late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Row(
          children: [
            GestureDetector(
              onTap: () {
                _shortbottomsheet();
              },
              child: Icon(Icons.filter_list,
                  size: height / 30, color: Colors.white),
            ),
            SizedBox(width: width / 50),
            GestureDetector(
              onTap: () {
                _shortbottomsheet();
              },
              child: Text(
                LanguageEn.sort,
                style: TextStyle(
                  fontSize: height / 50,
                  fontFamily: 'GilroyBold',
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: width / 20),
            Container(
              height: height / 20,
              width: width / 250,
              color: Colors.white.withOpacity(0.3),
            ),
            SizedBox(width: width / 20),
            GestureDetector(
                onTap: () {
                  _filterbottomsheet();
                },
                child: Icon(Icons.filter_alt, size: height / 30,color: Colors.white,)),
            SizedBox(width: width / 50),
            GestureDetector(
              onTap: () {
                _filterbottomsheet();
              },
              child: Text(
                LanguageEn.filter,
                style:
                    TextStyle(color: Colors.white,fontSize: height / 50, fontFamily: 'GilroyBold'),
              ),
            )
          ],
        ),
        // icon: const Icon(Icons.thumb_up),
        backgroundColor: buttoncolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          SizedBox(height: height / 17),
          Row(
            children: [
              SizedBox(width: width / 20),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back,
                    color:  const Color(0xffFC9340), size: height / 30),
              ),
              // const Spacer(),
              // Icon(Icons.shopping_basket,
              //     color: buttoncolor, size: height / 30),
              SizedBox(width: width / 20),
            ],
          ),
          SizedBox(height: height / 80),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.shopping,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height / 30,
                  fontFamily: 'GilroyBold',
                ),
              )
            ],
          ),
          SizedBox(height: height / 200),
          Row(
            children: [
              SizedBox(width: width / 20),
              Text(
                LanguageEn.findandbuy,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: height / 50,
                  fontFamily: 'GilroyMedium',
                ),
              )
            ],
          ),
          SizedBox(height: height / 50),
          Row(
            children: [
              SizedBox(width: width / 30),
              Container(
                width: width / 1.1,
                color: Colors.transparent,
                height: height / 15,
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: LanguageEn.searchproduct,
                    suffixIcon: const Icon(Icons.search_rounded),
                    hintStyle:   TextStyle(color: Colors.grey),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(
                        color: Color(0xffE0E0E0),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Color(0xffE0E0E0),
                      ),
                    ),
                  ),
                ),
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
                                  ?  const Color(0xffFC9340)
                                  :  const Color(0xffFC9340).withOpacity(0.10),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                txt[index].toString(),
                                style: TextStyle(
                                    color: selectedindex == index
                                        ? Colors.white
                                        :  const Color(0xffFC9340),
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/Adopt');
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 20),
                        child: Container(
                          color: Colors.transparent,
                          height: height / 5,
                          width: width,
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: height / 2.5,
                                mainAxisExtent: height / 3.1,
                                childAspectRatio: 3 / 2,
                                // crossAxisSpacing: height / 100,
                                // mainAxisSpacing: height / 50,
                              ),
                              itemCount: catogeryimagelist.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: height / 2,
                                    width: width / 5,
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
                                        SizedBox(height: height / 70),
                                        Container(
                                          height: height / 5,
                                          width: width / 2.8,
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                                catogeryimagelist[index],
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(height: height / 70),
                                        Row(
                                          children: [
                                            SizedBox(width: width / 25),
                                            Text(
                                              allbestsellingitemtitle[index],
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: height / 55,
                                                fontFamily: 'GilroyBold',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: height / 200),
                                        Row(
                                          children: [
                                            SizedBox(width: width / 25),
                                            Text(
                                              bestsellingitemprice[index],
                                              style: TextStyle(
                                                color: const Color(0xffed6f50),
                                                fontSize: height / 45,
                                                fontFamily: 'GilroyBold',
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                )
              : selectedindex == 1
                  ? Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Adopt');
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 20),
                            child: Container(
                              color: Colors.transparent,
                              height: height / 5,
                              width: width,
                              child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: height / 2.5,
                                    mainAxisExtent: height / 3.1,
                                    childAspectRatio: 3 / 2,
                                    // crossAxisSpacing: height / 100,
                                    // mainAxisSpacing: height / 50,
                                  ),
                                  itemCount: foodbestsellingitemtitle.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height / 2,
                                        width: width / 5,
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
                                            SizedBox(height: height / 70),
                                            Container(
                                              height: height / 5,
                                              width: width / 2.8,
                                              decoration: const BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                    catogeryimagelist[index],
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            SizedBox(height: height / 70),
                                            Row(
                                              children: [
                                                SizedBox(width: width / 25),
                                                Text(
                                                  foodbestsellingitemtitle[
                                                      index],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: height / 55,
                                                    fontFamily: 'GilroyBold',
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: height / 200),
                                            Row(
                                              children: [
                                                SizedBox(width: width / 25),
                                                Text(
                                                  bestsellingitemprice[index],
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xffed6f50),
                                                    fontSize: height / 45,
                                                    fontFamily: 'GilroyBold',
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/Adopt');
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 20),
                            child: Container(
                              color: Colors.transparent,
                              height: height / 5,
                              width: width,
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: height / 2.5,
                                  mainAxisExtent: height / 3.1,
                                  childAspectRatio: 3 / 2,
                                  // crossAxisSpacing: height / 100,
                                  // mainAxisSpacing: height / 50,
                                ),
                                itemCount: shampoobestsellingitemtitle.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height / 2,
                                      width: width / 5,
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
                                          SizedBox(height: height / 70),
                                          Container(
                                            height: height / 5,
                                            width: width / 2.8,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(15),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.asset(
                                                  catogeryimagelist[index],
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          SizedBox(height: height / 70),
                                          Row(
                                            children: [
                                              SizedBox(width: width / 25),
                                              Text(
                                                shampoobestsellingitemtitle[
                                                    index],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: height / 55,
                                                  fontFamily: 'GilroyBold',
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: height / 200),
                                          Row(
                                            children: [
                                              SizedBox(width: width / 25),
                                              Text(
                                                bestsellingitemprice[index],
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xffed6f50),
                                                  fontSize: height / 45,
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
                          ),
                        ),
                      ),
                    )
        ],
      ),
    );
  }
  Future _shortbottomsheet() {
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: height / 30),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 20,
                        ),
                        Text(
                          LanguageEn.sort,
                          style: TextStyle(color: Colors.black,
                            fontSize: height / 25,
                            fontFamily: 'GilroyBold',
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height / 100),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 20,
                        ),
                        Text(
                          LanguageEn.arrangebasedonthe,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: height / 48,
                            fontFamily: 'GilroyMedium',
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height / 40),
                    Padding(
                      padding: EdgeInsets.only(left: width / 40),
                      child: Column(
                        children: List.generate(
                          checkList2Items.length,
                              (index) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: width / 1.1,
                              decoration: BoxDecoration(
                                border: Border.all(color: greay),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: CheckboxListTile(
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                    width: 1.0,
                                    color: buttoncolor,
                                  ),
                                ),
                                checkColor: Colors.white,
                                activeColor: buttoncolor,
                                controlAffinity:
                                ListTileControlAffinity.trailing,
                                contentPadding: EdgeInsets.zero,
                                title: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: [
                                      SizedBox(width: width / 20),
                                      Text(
                                        checkList2Items[index]["title"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: height / 60,
                                            fontFamily: 'GilroyMedium'),
                                      ),
                                    ],
                                  ),
                                ),
                                value: checkList2Items[index]["value"],
                                onChanged: (value) {
                                  setState(
                                        () {
                                      for (var element in checkList2Items) {
                                        element["value"] = false;
                                      }
                                      checkList2Items[index]["value"] = value;
                                      selected =
                                      "${checkList2Items[index]["id"]}, ${checkList2Items[index]["title"]}, ${checkList2Items[index]["value"]}";
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height / 50),
                    Row(
                      children: [
                        SizedBox(width: width / 20),
                        filterbottomsheetbutton(width / 3, Colors.transparent,
                            const Color(0xffFC9340), LanguageEn.reset,  const Color(0xffFC9340)),
                        SizedBox(width: width / 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            // Navigator.pushNamed(context, '/Adopt');
                          },
                          child: filterbottomsheetbutton(width / 2,  const Color(0xffFC9340),
                              Colors.transparent, LanguageEn.apply, Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 50),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }

  Future _filterbottomsheet() {
    return showModalBottomSheet<dynamic>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: <Widget>[
                Column(
                  children: [
                    SizedBox(height: height / 30),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 20,
                        ),
                        Text(
                          LanguageEn.filter,
                          style: TextStyle(color: Colors.black,
                            fontSize: height / 25,
                            fontFamily: 'GilroyBold',
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height / 100),
                    Row(
                      children: [
                        SizedBox(
                          width: width / 20,
                        ),
                        Text(
                          LanguageEn.filterproductwithmore,
                          style: TextStyle(
                            color: Colors.grey
                            ,
                            fontSize: height / 48,
                            fontFamily: 'GilroyMedium',
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height / 30),
                    Row(
                      children: [
                        SizedBox(width: width / 20),
                        Text(
                          LanguageEn.pricerange,
                          style: TextStyle(
                              fontFamily: 'GilroyMedium',
                              fontSize: height / 50,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    RangeSlider(
                      activeColor: buttoncolor,
                      inactiveColor: const Color(0xffecedfa),

                      values: _currentRangeValues,
                      min: 0,
                      //divisions: 20,
                      max: 100,
                      // labels: RangeLabels(
                      //   _currentRangeValues.start
                      //       .round()
                      //       .toString(),
                      //   _currentRangeValues.end
                      //       .round()
                      //       .toString(),
                      // ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    Row(
                      children: [
                        SizedBox(width: width / 20),
                        Text(
                          "\$50.00",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: height / 50,
                            fontFamily: 'GilroyMedium',
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "\$50.00",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: height / 50,
                            fontFamily: 'GilroyMedium',
                          ),
                        ),
                        SizedBox(width: width / 20),
                      ],
                    ),
                    SizedBox(height: height / 25),
                    Row(
                      children: [
                        SizedBox(width: width / 20),
                        Text(
                          LanguageEn.brand,
                          style: TextStyle(
                              fontFamily: 'GilroyMedium',
                              fontSize: height / 50,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(height: height / 40),
                    Row(
                      children: [
                        SizedBox(width: width / 20),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            height: height / 5,
                            width: width,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: height / 15,
                                  mainAxisExtent: height / 7,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 5),
                              itemCount: brand.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedindex = index;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffecedfa),
                                      border: Border.all(
                                        width: 2,
                                        color: selectedindex == index
                                            ? buttoncolor
                                            : Colors.transparent,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        brand[index],
                                        style: TextStyle(
                                            fontFamily: 'GilroyMedium',
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: height / 55),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 20),
                    Row(
                      children: [
                        SizedBox(width: width / 20),
                        filterbottomsheetbutton(width / 3, Colors.transparent,
                          const Color(0xffFC9340), LanguageEn.reset,  const Color(0xffFC9340),),
                        SizedBox(width: width / 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            // Navigator.pushNamed(context, '/Adopt');
                          },
                          child: filterbottomsheetbutton(width / 2,  const Color(0xffFC9340),
                              Colors.transparent, LanguageEn.apply, Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 40),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }

  Widget filterbottomsheetbutton(w, color, bordercolor, txt, fontcolor) {
    return Container(
      height: height / 17,
      width: w,
      decoration: BoxDecoration(
        border: Border.all(color: bordercolor, width: 2),
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Center(
        child: Text(
          txt,
          style: TextStyle(
              fontFamily: 'GilroyBold',
              fontSize: height / 50,
              color: fontcolor),
        ),
      ),
    );
  }
}
