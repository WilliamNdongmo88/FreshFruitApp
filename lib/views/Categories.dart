import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_app/utils/ProductItem.dart';

import '../utils/CallableWidget.dart';
import '../utils/Widgets.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
  List<String> tabs = ["Fruits", "Mushroom", "Dairy", "Oats", "Vegetables","Bread","Rice","Egg"];
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
                          top: 95.r, right: 20.r, left: 20.r, bottom: 10.r),
                      child: Container(
                        margin: EdgeInsets.only(top: 5.r),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/Back.svg',
                                    width: 25.sp,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFF000000),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 120.r),
                                child: Text(
                                'Categories',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    /* Start List Categories */
                    CategoriesTab(tabs),
                    /* End List Categories */
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            getFooters(callBackFunction: funChange, currentIndex: 1),
      ),
    );
  }
}
