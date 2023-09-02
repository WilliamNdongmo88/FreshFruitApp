import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_app/utils/Widgets.dart';

import '../utils/CallableWidget.dart';
import '../utils/ProductItem.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  void funChange(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }
  List<ProductItem> products = [
    ProductItem('orange','Orange', 5.5,),
    ProductItem('Garlic','Garlic', 6.7,),
    ProductItem('RedOnion','Onion', 10,),
    ProductItem('Broccoli','Broccoli', 5,),
    ProductItem('Banane','Banane', 7.5,),
    ProductItem('Tomate','Tomate', 6,),
    ProductItem('Pomme','Pomme', 9,),
    ProductItem('Chou','Chou', 7,),
  ];
  late String userName;
  @override
  void initState() {  
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
                                'Item details',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                      ),
                    ),
                    /* Start List shoppingcart */
                    shoppingcart(products),
                    /* End List shoppingcart */
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            getFooters(callBackFunction: funChange, currentIndex: 2),
      ),
    );
  }
}
