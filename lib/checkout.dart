import 'package:delivery_app/cart.dart';
import 'package:delivery_app/globalWidget.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool switchColor = false;
    //.........................................
    //......Dimension Declaration..................
    //.........................................
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    double sideMagin = cWidth * 0.05;
    double bRadius = 5;
    Color black = Colors.black;

    return Scaffold(
      appBar: customAppBar(context, sideMagin, "Checkout"),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sideMagin),
        child: Column(
          children: [
            SizedBox(
              height: cHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Address",
                  style: subText1(value: 0.6, size: 16),
                ),
                Text(
                  "Edit",
                  style: TextStyle(color: cPrimary),
                )
              ],
            ),
            SizedBox(
              height: cHeight * 0.05,
            ),

            //Read about TextFormField and it decoration
            TextFormField(
              controller: addressController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "403 Nwaniba Road, Uyo"),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                print(addressController.text);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: sideMagin),
                padding: EdgeInsets.symmetric(
                    horizontal: cWidth * 0.2, vertical: cWidth * 0.04),
                decoration: BoxDecoration(
                    color: cPrimary,
                    borderRadius: BorderRadius.circular(sideMagin)),
                child: Text(
                  "PLACE ORDER",
                  style: TextStyle(color: cWhite),
                ),
              ),
            ),
            SizedBox(
              height: cHeight * 0.05,
            ),
          ],
        ),
      )),
    );
  }
}
