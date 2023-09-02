import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/CallableWidget.dart';
import '../utils/ProductItem.dart';
import '../utils/Widgets.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  void funChange(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }
  List<ProductItem> products = [
    ProductItem('orange','Orange', 5.5,),
    // ProductItem('Garlic','Garlic', 6.7,),
    // ProductItem('RedOnion','Onion', 10,),
    // ProductItem('Broccoli','Broccoli', 5,),
    ProductItem('Banane','Banane', 7.5,),
    ProductItem('Tomate','Tomate', 6,),
    // ProductItem('Pomme','Pomme', 9,),
    // ProductItem('Chou','Chou', 7,),
  ];

  late String userName;
  @override
  void initState() {
    userName = 'Rafatul islam';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 85.r, right: 20.r, left: 20.r, bottom: 10.r),
                      child: Container(
                        margin: EdgeInsets.only(left: 75.r, top: 10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Favorite's",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /* Start List FavoriteCart */
                    FavoriteCart(products),
                    /* End List FavoriteCart */
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            getFooters(callBackFunction: funChange, currentIndex: 3),
      ),
    );
  }
}
