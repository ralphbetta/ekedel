import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';

Container productIconCard(IconData icon, String title, context) {
  double fullWidth = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.only(right: fullWidth * 0.1),
    child: Row(
      children: [
        Icon(
          icon,
          color: cPrimary,
        ),
        SizedBox(
          width: fullWidth * 0.01,
        ),
        Text(
          title,
          style: subText1Bold(size: 17),
        ),
      ],
    ),
  );
}
