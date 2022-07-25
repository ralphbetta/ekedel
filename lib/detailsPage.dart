// import 'dart:ui';

// import 'package:delivery_app/homepage.dart';
// import 'package:delivery_app/style.dart';
// import 'package:flutter/material.dart';

// class DetailScreen extends StatefulWidget {
//   const DetailScreen({Key? key, required this.dataSet, required this.products})
//       : super(key: key);

//   final Map dataSet;
//   final List products;

//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     int tapCount = 2;
//     int activeTab = 0;
//     bool switchColor = false;
//     //.........................................
//     //......Dimension Declaration..................
//     //.........................................
//     double cHeight = MediaQuery.of(context).size.height;
//     double cWidth = MediaQuery.of(context).size.width;
//     double sideMagin = cWidth * 0.03;
//     double bRadius = 5;
//     Color black = Colors.black;

//     //.........................................
//     //......Detail Categories dataset..................
//     //.........................................

//     List category = ["Burger", "Sandwich", "Pizza", "Smoothie"];

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: cWhite,
//         iconTheme: IconThemeData(color: Colors.black),
//         elevation: 0.00,

//         //.........................................
//         //......This is the title section...........
//         //.........................................
//         title: Text(
//           "Restaurant View",
//           style: subText1Bold(value: 0.8, size: 18),
//         ),
//         //.........................................
//         //......This is the action section...........
//         //.........................................

//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey.withOpacity(0.3),
//               child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.more_vert,
//                     color: Colors.black,
//                   )),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: [
//             Container(
//               margin: EdgeInsets.only(
//                   left: sideMagin, right: sideMagin, bottom: sideMagin),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: cWidth,
//                     height: cWidth * 0.35,
//                     margin: EdgeInsets.only(bottom: sideMagin),
//                     decoration: BoxDecoration(
//                         color: Colors.green,
//                         image: DecorationImage(
//                             image: AssetImage(
//                               widget.dataSet['image'],
//                             ),
//                             fit: BoxFit.fitWidth),
//                         borderRadius: BorderRadius.circular(sideMagin)),
//                   ),
//                   Text(
//                     widget.dataSet['title'],
//                     style: subText1Bold(size: 17, value: 0.7),
//                   ),
//                   Text(
//                     "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.",
//                     style: TextStyle(
//                       color: Colors.black38,
//                       wordSpacing: 5,
//                     ),
//                     textAlign: TextAlign.justify,
//                   ),
//                   SizedBox(
//                     height: cWidth * 0.02,
//                   ),
//                   Row(
//                     children: [
//                       ...List.generate(
//                           widget.products.length,
//                           (index) => Padding(
//                                 padding: EdgeInsets.only(right: cWidth * 0.03),
//                                 child: Text(
//                                   widget.products[index],
//                                   style: subText1(value: 0.4, size: 12),
//                                 ),
//                               ))
//                     ],
//                   ),
//                   SizedBox(
//                     height: cWidth * 0.02,
//                   ),
//                   Row(
//                     children: [
//                       productIconCard(Icons.star_rate_outlined,
//                           widget.dataSet['rating'], context),
//                       productIconCard(Icons.emoji_transportation_outlined,
//                           widget.dataSet['delivery-charge'], context),
//                       productIconCard(Icons.timer_sharp,
//                           widget.dataSet['duration'], context)
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ...List.generate(
//                     category.length,
//                     (index) => GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               activeTab = index;
//                             });
//                             print(activeTab);
//                           },
//                           child: CircleAvatar(
//                             backgroundColor:
//                                 activeTab == index ? cPrimary : gray,
//                             radius: 50,
//                             child: Text(
//                               category[index],
//                               style: TextStyle(),
//                             ),
//                           ),
//                         ))
//               ],
//             ),
//             Container(
//               width: cWidth,
//               height: cWidth * 0.1,
//               child: ListView.builder(
//                   itemCount: category.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (BuildContext context, index) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           tapCount = 0;
//                         });
//                         print(tapCount);
//                         print(index);

//                         tapCount == index ? print(true) : print(false);
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(left: sideMagin),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 20),
//                           child: Text(
//                             category[index],
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: tapCount == index ? cWhite : black),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                             color: tapCount == index
//                                 ? cPrimary
//                                 : Colors.transparent,
//                             border: Border.all(
//                                 width: 2,
//                                 color: tapCount == index ? cPrimary : gray),
//                             borderRadius: BorderRadius.circular(20)),
//                       ),
//                     );
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
