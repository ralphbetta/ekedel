import 'package:delivery_app/checkout.dart';
import 'package:delivery_app/globalData.dart';
import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    double sideMagin = cWidth * 0.05;
    double bRadius = 5;
    Color black = Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: subText1(size: 18, value: 1),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: transDarkColor(0.8)),
        titleTextStyle: TextStyle(color: transDarkColor(0.8)),
        backgroundColor: cWhite,
      ),
      body: SafeArea(
        child: cartData.isEmpty
            ? Center(
                child: Text(
                  "Sorry, Cart is empty",
                  style: subText1(),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(
                              cartData.length,
                              (index) => Container(
                                    width: cWidth,
                                    height: cWidth * 0.2,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: sideMagin, vertical: 5),
                                    decoration: BoxDecoration(
                                        color: cWhite,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0xfff2f2f2),
                                              offset: Offset(0.3, 0.3),
                                              blurRadius: 10.0)
                                        ]),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: cWidth * 0.2,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      cartData[index]['image']),
                                                  fit: BoxFit.fill)),
                                        ),
                                        SizedBox(
                                          width: cWidth * 0.04,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              cartData[index]['title'],
                                              style: subText1Bold(
                                                  value: 0.8, size: 17),
                                            ),
                                            Text(
                                              cartData[index]['title'],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: cWidth * 0.06,
                                        ),
                                        Text(
                                          cartData[index]['price'],
                                        ),
                                        Expanded(child: Container()),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cartData
                                                    .remove(cartData[index]);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                        SizedBox(
                                          width: cWidth * 0.02,
                                        ),
                                      ],
                                    ),
                                  )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: cWidth * 0.05,
                  ),
                  customButton(sideMagin, cWidth, context),
                  SizedBox(
                    height: cWidth * 0.05,
                  )
                ],
              ),
      ),
    );
  }
}

customButton(double sideMagin, double cWidth, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Checkout();
      }));
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: sideMagin),
      padding: EdgeInsets.symmetric(
          horizontal: cWidth * 0.2, vertical: cWidth * 0.04),
      decoration: BoxDecoration(
          color: cPrimary, borderRadius: BorderRadius.circular(sideMagin)),
      child: Text(
        "Proceed to checkout \$" + calcAmount(),
        style: TextStyle(color: cWhite),
      ),
    ),
  );
}

//side function.

String calcAmount() {
  int localAmount = 0;
  for (Map data in cartData) {
    String mixedPrice = data['price'].toString().split("\$").last;
    localAmount = localAmount + int.parse(mixedPrice);
  }
  return localAmount.toString();
}

transf() {
  String pen = "Hello, dear, how are you";
  List penList = pen.split(","); // ['Hello', " dear", " how are you"];
  String first = penList[0]; // pen_list.first
}
