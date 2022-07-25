import 'package:flutter/material.dart';

//.........................................
//......Style Declaration..................
//.........................................
TextStyle titleText1() {
  return TextStyle(
    fontSize: 14,
    color: cPrimary,
  );
}

TextStyle subText1({double value = 0.5, double size = 14}) {
  return TextStyle(
    fontSize: size,
    color: transDarkColor(value),
  );
}

TextStyle subText1Bold({double value = 0.5, double size = 14}) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.bold,
    color: transDarkColor(value),
  );
}

//.........................................
//......Color Declaration..................
//.........................................
Color gray = Color(0xfff2f2f2);
Color cWhite = Color(0xffffffff);
Color cPrimary = Color(0xffff7622);
Color cBlack = Color(0xff000000);

Color transDarkColor(double value) {
  return Color(0xff000000).withOpacity(value);
}
