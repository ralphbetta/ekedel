import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool switchTab = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GestureDetector(
          onTap: () {
            setState(() {
              switchTab = !switchTab;
            });
          },
          child: Container(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: switchTab ? cPrimary : Colors.green,
                )
              ],
            ),
          ),
        ));
  }
}
