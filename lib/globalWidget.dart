import 'package:delivery_app/cart.dart';
import 'package:delivery_app/globalData.dart';
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

AppBar customAppBar(BuildContext context, double sideMagin, String title) {
  return AppBar(
    title: Text(
      title,
      style: subText1(size: 18),
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: transDarkColor(0.8)),
    titleTextStyle: TextStyle(color: transDarkColor(0.8)),
    actions: [
      CircleAvatar(
          backgroundColor: Colors.green.withOpacity(0.2),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_bag),
                color: transDarkColor(0.8),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return CartPage();
                  }));
                },
              ),
              Positioned(
                top: 7,
                right: 0,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: cPrimary,
                  child: Text(
                    cartData.length.toString(),
                    style: TextStyle(color: cWhite),
                  ),
                ),
              )
            ],
          )),
      SizedBox(
        width: sideMagin,
      )
    ],
  );
}
