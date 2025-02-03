import 'package:boom_car/utils/colors.dart';
import 'package:flutter/material.dart';

void showLoaderDialog(BuildContext context) {
  final AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          color: secondayColor,
        ),
        Container(
          margin: const EdgeInsets.only(left: 7),
          child: const Text("Loading..."),
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
