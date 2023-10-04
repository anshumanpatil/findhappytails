import 'package:flutter/material.dart';
import 'package:findhappytails/utils/colors.dart';
import 'package:findhappytails/utils/mediaqury.dart';
import 'package:provider/provider.dart';

import '../utils/colornotifire.dart';

class PasswordCustoomTextfild extends StatefulWidget {
  final String? hintText;

  const PasswordCustoomTextfild(this.hintText, {Key? key}) : super(key: key);

  @override
  State<PasswordCustoomTextfild> createState() =>
      _PasswordCustoomTextfildState();
}

class _PasswordCustoomTextfildState extends State<PasswordCustoomTextfild> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    late ColorNotifier notifier;
    notifier = Provider.of<ColorNotifier>(context, listen: true);
    return Container(
      color: Colors.transparent,
      height: height / 13,
      width: width / 1.1,
      child: TextField(
        style: TextStyle(color: notifier.getblack),
        obscureText: _obscureText,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                _toggle();
              },
              child: _obscureText
                  ? const Icon(Icons.remove_red_eye_rounded)
                  : const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.grey,
                    )),
          contentPadding: const EdgeInsets.only(left: 10),
          hintText: widget.hintText,
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
