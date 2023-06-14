// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pokeapp/const/colors.dart';
import 'package:pokeapp/const/text_style.dart';

Widget rowStyling({String? text, String? value}) {
  return Row(
    children: [
      SizedBox(
          width: 100,
          child: headingText(color: grey, size: 16, text: text)),
      headingText(color: grey, size: 16, text: value),
    ],
  );
}
