import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:findhappytails/custtomscreen/button.dart';
import 'package:findhappytails/custtomscreen/textfild.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/enstring.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPet extends StatefulWidget {
  const NewPet({Key? key}) : super(key: key);

  @override
  State<NewPet> createState() => _NewPetState();
}

class _NewPetState extends State<NewPet> {
  PickedFile? imageFile;
  String dropdownvalue = 'Bulldog';
  int _groupValue = 0;
  var items = [
    'Bulldog',
    'Pug',
    'Bichon Frise',
    'Labrador',
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

  DateTime currentDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  //late ColorNotifier notifier;

  @override
  Widget build(BuildContext context) {
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 17),
            Row(
              children: [
                SizedBox(width: width / 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: height / 30,
                    color: const Color(0xffFC9340),
                  ),
                )
              ],
            ),
            SizedBox(height: height / 50),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.newpet,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'GilroyBold',
                    fontSize: height / 25,
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.addyournewfurry,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 45,
                  ),
                )
              ],
            ),
            SizedBox(height: height / 30),
            addphoto(),
            SizedBox(height: height / 30),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.petname,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            CustoomTextfild(LanguageEn.yourbuddyname),
            SizedBox(height: height / 70),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.typeofpet,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            Container(
              color: Colors.transparent,
              height: height / 12,
              width: width / 1.1,
              child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: TextStyle(
                      color: const Color(0xffE0E0E0), fontSize: height / 60),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffE0E0E0), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xffE0E0E0), width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: Row(
                  children: const [
                    // SizedBox(width: width / 100),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xffE0E0E0),
                    ),
                  ],
                ),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'GilroyMedium'),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
            SizedBox(height: height / 100),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.breed,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            CustoomTextfild(LanguageEn.breed),
            SizedBox(height: height / 80),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.birthdate,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectDate(context);
                });
              },
              child: Center(
                child: Container(
                  height: height / 16,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(
                      color: const Color(0xffE0E0E0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: width / 30),
                      Text(
                        currentDate.day.toString(),
                        style: const TextStyle(
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                      const Text(
                        "/",
                        style: TextStyle(
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                      Text(
                        currentDate.month.toString(),
                        style: const TextStyle(
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                      const Text(
                        "/",
                        style: TextStyle(
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                      Text(
                        currentDate.year.toString(),
                        style: const TextStyle(
                          color: Color(0xffE0E0E0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height / 40),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.gender,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genderselect(LanguageEn.male, 0),
                SizedBox(width: width / 50),
                genderselect(LanguageEn.female, 1),
              ],
            ),
            SizedBox(height: height / 40),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.weight,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            const CustoomTextfild("3.5kg"),
            SizedBox(height: height / 80),
            Row(
              children: [
                SizedBox(width: width / 20),
                Text(
                  LanguageEn.weight,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'GilroyMedium',
                    fontSize: height / 55,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 80),
            discription(),
            SizedBox(height: height / 18),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Custombutton.button(
                LanguageEn.save,
                width / 1.1,
                Colors.transparent,
                const Color(0xffFC9340),
                Colors.white,
              ),
            ),
            SizedBox(height: height / 20),
          ],
        ),
      ),
    );
  }

  Widget discription() {
    return Container(
      color: Colors.transparent,
      height: height / 5,
      width: width / 1.1,
      child: TextField(
        style: TextStyle(color: Colors.black),
        maxLines: 10,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, top: 30),
          hintText: LanguageEn.shareabouthestory,
          hintStyle: TextStyle(
            color: greay,
            fontFamily: 'GilroyMedium',
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffE0E0E0),
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffE0E0E0),
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  Widget genderselect(gender, val) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _groupValue = val as int;
          },
        );
      },
      child: Container(
        height: height / 16,
        width: width / 2.3,
        decoration: BoxDecoration(
          border: Border.all(
              color: _groupValue == val ? buttoncolor : Colors.transparent,
              width: 2),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: buttoncolor.withOpacity(0.10),
        ),
        child: Row(
          children: [
            SizedBox(width: width / 20),
            Text(
              gender,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height / 50,
                  fontFamily: 'GilroyMedium'),
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

  Widget addphoto() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                // _openCamera(context);
              });
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                child: (imageFile == null)
                    ? DottedBorder(
                        strokeWidth: 5,
                        dashPattern: const [6, 6, 6, 6],
                        borderType: BorderType.RRect,
                        color: const Color(0xffc5c5c5),
                        radius: const Radius.circular(20),
                        child: Container(
                          height: height / 4.3,
                          width: width / 1.1,
                          color: const Color(0xfff5f5f5),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.camera_alt,
                                    color: Color(0xffc5c5c5)),
                                SizedBox(width: width / 40),
                                Text(
                                  LanguageEn.addphoto,
                                  style: TextStyle(
                                    color: const Color(0xffc5c5c5),
                                    fontFamily: 'GilroyMedium',
                                    fontSize: height / 50,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : DottedBorder(
                        strokeWidth: 5,
                        dashPattern: const [6, 6, 6, 6],
                        borderType: BorderType.RRect,
                        color: const Color(0xffc5c5c5),
                        radius: const Radius.circular(20),
                        child: Container(
                          height: height / 4.3,
                          width: width / 1.1,
                          color: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            child: Image.file(
                              File(
                                imageFile!.path,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// void _openCamera(BuildContext context) async {
//   PickedFile? file = await ImagePicker().getImage(
//     source: ImageSource.gallery,
//   );
//   // final pickedFile = await ImagePicker().getImage(
//   //   source: ImageSource.gallery,
//   // );
//   setState(() {
//     imageFile = file!;
//   });
// }
}
