import 'package:flutter/material.dart';
import 'package:pharmacy_store/constants/constants.dart';

class Search_Text_Field extends StatelessWidget {
  String text = "";
  Search_Text_Field(this.text);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Constants.primary_color, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
