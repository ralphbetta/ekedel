import 'package:delivery_app/style.dart';
import 'package:flutter/material.dart';

import 'details.dart';
import 'globalWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //.........................................
  //......Dimension Initialization..................
  //.........................................
  double cHeight = 0.0;
  double cWidth = 0.0;
  double sideMagin = 0.0;
  double bRadius = 0.0;

  int activeCategories = 0;

  //.........................................
  //......Salution Dataset..................
  //.........................................

  Map salution = {
    "morning": "Good Morning",
    "afternoon": "Good Afternoon",
    "evening": "Good Evening"
  };

  //.........................................
  //......Categories Dataset..................
  //.........................................

  List<Map<String, String>> categories = [
    {"title": "All", "image": "assets/icons/fire.png"},
    {"title": "Hot Dog", "image": "assets/icons/hotdog.png"},
    {"title": "Burger", "image": "assets/icons/hamburger.png"},
    {"title": "Smoothie", "image": "assets/icons/smoothie.png"},
  ];

  List productDataSet = [
    {
      "title": "Rose Garden Restaurant",
      "rating": "4.2",
      "delivery-charge": "Free",
      "duration": "20 min",
      "category": "Burger",
      "image": "assets/images/restaurant3.jpg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.",
    },
    {
      "title": "Morning Spiecy Restaurant",
      "rating": "4.6",
      "delivery-charge": "N500",
      "category": "Hot Dog",
      "duration": "15 min",
      "image": "assets/images/restaurant2.jpg",
      "description":
          "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. "
    },
    {
      "title": "Becky Yummy Restaurant",
      "rating": "4.8",
      "delivery-charge": "N200",
      "category": "Smoothie",
      "duration": "1 hour",
      "image": "assets/images/restaurant1.jpg",
      "description":
          "Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. "
    },
    {
      "title": "Rose Garden Restaurant",
      "rating": "4.2",
      "delivery-charge": "Free",
      "duration": "20 min",
      "category": "Burger",
      "image": "assets/images/restaurant3.jpg",
      "description":
          "Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. ",
    },
  ];

  List sortedProductDataSet = [];

  List products = ["Burger", "~ Chiken", "~ Riche", "~Wings"];

  @override
  Widget build(BuildContext context) {
    //.........................................
    //......Dimension Declaration..................
    //.........................................
    cHeight = MediaQuery.of(context).size.height;
    cWidth = MediaQuery.of(context).size.width;
    sideMagin = cWidth * 0.03;
    bRadius = 5;

    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        backgroundColor: cWhite,
        elevation: 0.00,
        //.........................................
        //......This is the leading section...........
        //.........................................
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: gray,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.subject_rounded,
                  color: transDarkColor(0.7),
                )),
          ),
        ),

        //.........................................
        //......This is the title section...........
        //.........................................
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DELIVERY TO", style: titleText1()),
            Text(
              "Eke's Dev Services",
              style: subText1(),
            )
          ],
        ),

        //.........................................
        //......This is the action section...........
        //.........................................

        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: transDarkColor(0.9),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: cWhite,
                      )),
                ),
              ),
              Positioned(
                top: 7,
                right: 10,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: cPrimary,
                  child: Text(
                    "3",
                    style: TextStyle(color: cWhite),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //.........................................
            //......Salutation Section...........
            //.........................................

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sideMagin, vertical: sideMagin * 1.5),
              child: Row(
                // assignment
                //write a function to check time and display the corressponding salutation
                children: [
                  Text(
                    "Hey Eke!, ",
                    style: subText1(size: 15, value: 0.7),
                  ),
                  Text(
                    salution['morning'],
                    style: subText1Bold(size: 18, value: 0.7),
                  )
                ],
              ),
            ),
            //.........................................
            //...............Search Bar................
            //.........................................

            Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: transDarkColor(0.2),
                        )),
                    Text(
                      "Search Dishes, Restaurant",
                      style: subText1(value: 0.4, size: 15),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: gray, borderRadius: BorderRadius.circular(bRadius)),
                margin: EdgeInsets.symmetric(horizontal: sideMagin)),

            //.........................................
            //...............Categories Bar............
            //.........................................

            Sepearator(
              title: "All Categories",
            ),

            //.........................................
            //...............Categories List............
            //.........................................

            Container(
              width: cWidth,
              height: cWidth * 0.14,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        List thisProduct = productDataSet
                            .where((element) =>
                                element['category'] ==
                                categories[index]['title'])
                            .toList();

                        setState(() {
                          activeCategories = index;
                          sortedProductDataSet = thisProduct;
                        });
                      },
                      child: categoryCard(cWidth, sideMagin, categories[index],
                          activeCategories == index ? true : false),
                    );
                  }),
            ),

            //.........................................
            //...............Categories Bar............
            //.........................................

            Sepearator(
              title: "Open Restorants",
            ),

            ...List.generate(
                sortedProductDataSet.isEmpty
                    ? productDataSet.length
                    : sortedProductDataSet.length,
                (index) => InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Detail(
                            dataSet: sortedProductDataSet.isEmpty
                                ? productDataSet[index]
                                : sortedProductDataSet[index],
                            products: [],
                          );
                        }));
                      },
                      child: ProductCard(
                        products: products,
                        dataSet: sortedProductDataSet.isEmpty
                            ? productDataSet[index]
                            : sortedProductDataSet[index],
                      ),
                    )),
          ],
        ),
      ),
    );
  }
}

categoryCard(double cWidth, double sideMagin, Map data, bool active) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: sideMagin * 0.5),
    margin: EdgeInsets.only(left: sideMagin),
    height: cWidth * 0.14,
    decoration: BoxDecoration(
        color: active ? cPrimary.withOpacity(0.6) : gray.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
            radius: 20,
            backgroundColor: cWhite,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image(
                image: AssetImage(data['image']),
              ),
            )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sideMagin),
          child: Text(data['title']),
        ),
        SizedBox(width: 2)
      ],
    ),
  );
}

//.................................................................
//...............This is a reusable statleswidget class............
//................................................................

class Sepearator extends StatelessWidget {
  const Sepearator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11, vertical: 20),
      child: Row(
        children: [
          Text(
            title,
            style: subText1Bold(size: 17),
          ),
          Expanded(child: Container()),
          Text(
            "See All",
            style: subText1Bold(),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.products, required this.dataSet})
      : super(key: key);

  final List products;
  final Map dataSet;

  @override
  Widget build(BuildContext context) {
    double cHeight = MediaQuery.of(context).size.height;
    double cWidth = MediaQuery.of(context).size.width;
    double sideMagin = cWidth * 0.03;

    return Container(
      margin:
          EdgeInsets.only(left: sideMagin, right: sideMagin, bottom: sideMagin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: cWidth,
            height: cWidth * 0.35,
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: AssetImage(
                      dataSet['image'],
                    ),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.circular(sideMagin)),
          ),
          Text(
            dataSet['title'],
            style: subText1Bold(size: 17),
          ),
          SizedBox(
            height: cWidth * 0.02,
          ),
          Row(
            children: [
              ...List.generate(
                  products.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(right: cWidth * 0.03),
                        child: Text(
                          products[index],
                          style: subText1(value: 0.4, size: 12),
                        ),
                      ))
            ],
          ),
          SizedBox(
            height: cWidth * 0.02,
          ),
          Row(
            children: [
              productIconCard(
                  Icons.star_rate_outlined, dataSet['rating'], context),
              productIconCard(Icons.emoji_transportation_outlined,
                  dataSet['delivery-charge'], context),
              productIconCard(Icons.timer_sharp, dataSet['duration'], context)
            ],
          )
        ],
      ),
    );
  }
}
