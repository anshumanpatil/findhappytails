import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colornotifire.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';

class CustoomTextfild extends StatelessWidget {
  final String? hintText;

  const CustoomTextfild(this.hintText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //late ColorNotifier notifier;
    //notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Container(
      color: Colors.transparent,
      height: height / 13,
      width: width / 1.1,
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          hintText: hintText,
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
}
