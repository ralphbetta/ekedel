import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';
import 'globalWidget.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.dataSet, required this.products});

  final Map dataSet;
  final List products;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List category = ["Burger", "Sandwich", "Pizza", "Smoothie"];
  int count = 2;
  int activeTab = 0;

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

    print(widget.dataSet);
    print(widget.products);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurant View",
          style: subText1(size: 18),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: transDarkColor(0.8)),
        titleTextStyle: TextStyle(color: transDarkColor(0.8)),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.2),
            child: Icon(
              Icons.more_vert,
              color: transDarkColor(0.8),
            ),
          ),
          SizedBox(
            width: sideMagin,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //This container holds the first four columns
              Container(
                margin: EdgeInsets.symmetric(horizontal: sideMagin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: cWidth,
                        height: cHeight * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            image: DecorationImage(
                                image: AssetImage(widget.dataSet['image']),
                                fit: BoxFit.fitWidth),
                            borderRadius: BorderRadius.circular(10.0))),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sideMagin),
                      child: Text(
                        widget.dataSet['title'],
                        style: subText1Bold(size: 18, value: 0.8),
                      ),
                    ),
                    Text(
                      widget.dataSet['description'],
                    ),
                    SizedBox(
                      height: cWidth * 0.05,
                    ),
                    Row(
                      children: [
                        productIconCard(Icons.star_rate_outlined,
                            widget.dataSet['rating'], context),
                        productIconCard(Icons.emoji_transportation_outlined,
                            widget.dataSet['delivery-charge'], context),
                        productIconCard(Icons.timer_sharp,
                            widget.dataSet['duration'], context)
                      ],
                    )
                  ],
                ),
              ),

              //this container will hold the detail categories suggestion display
              Container(
                width: cWidth,
                height: cHeight * 0.06,
                margin: EdgeInsets.only(top: cWidth * 0.07),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeTab = i;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: sideMagin),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: activeTab == i
                                  ? cPrimary
                                  : Colors.transparent,
                              border: Border.all(
                                  width: 1,
                                  color: activeTab == i
                                      ? cPrimary
                                      : transDarkColor(0.5)),
                              borderRadius: BorderRadius.circular(sideMagin)),
                          child: Center(
                              child: Text(
                            category[i],
                            style: TextStyle(
                                color: activeTab == i
                                    ? cWhite
                                    : transDarkColor(0.8)),
                          )),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
