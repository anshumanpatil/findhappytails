import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class BreedDropDown extends StatefulWidget {
  final String selctedBreed;
  final List<String> list;
  final Function(String) onBreedChanged;

  const BreedDropDown(
      {super.key,
        required this.selctedBreed,
        required this.list,
        required this.onBreedChanged});

  @override
  State<BreedDropDown> createState() => _BreedDropDown();
}

class _BreedDropDown extends State<BreedDropDown> {
  String dropdownValue = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      popupProps: const PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
        // disabledItemFn: (String s) => s.startsWith('I'),
      ),
      items: widget.list,
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          // labelText: "Menu mode",
          hintText: "Select Country",
        ),
      ),
      onChanged: (String? value) {
        widget.onBreedChanged(value!);
        // setState(() {
        //   dropdownValue = value!;
        // });
      },
      selectedItem: widget.selctedBreed,
    );
  }
}
