// ignore_for_file: unrelated_type_equality_checks, unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/CallableWidget.dart';
import '../utils/ProductItem.dart';
import '../utils/Widgets.dart';
import 'Categories.dart';

class HomePage extends StatefulWidget {
  static const Homepage = '/HomePage';

  final token;
  HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => HomePageState(this.token);
}

class HomePageState extends State<HomePage> {
  final token;
  HomePageState(this.token);

  late String userName;
  @override
  void initState() {
    super.initState();
    userName = 'Rafatul islam';
    print('token 222 ---> $token');
    // fetchUserData();
  }

  void funChange(changetxt) {
    setState(() {});
  }

  final String apiUrl = 'https://stagingapi.chipchip.social/v1/users/me';

  Future<dynamic> fetchUserData() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Authorization': token,
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      print('statusCode user--> ${response.statusCode}');
      print('responseData User:--> $response');
      return json.decode(response.body);
    } else {
      throw Exception('Échec de la requête GET');
    }
  }

  List<ProductItem> products = [
    ProductItem(
      'orange',
      'Orange',
      5.5,
    ),
    ProductItem(
      'Garlic',
      'Garlic',
      6.7,
    ),
    ProductItem(
      'RedOnion',
      'Onion',
      10,
    ),
    ProductItem(
      'Broccoli',
      'Broccoli',
      5,
    ),
    ProductItem(
      'Banane',
      'Banane',
      7.5,
    ),
    ProductItem(
      'Tomate',
      'Tomate',
      6,
    ),
    ProductItem(
      'Pomme',
      'Pomme',
      9,
    ),
    ProductItem(
      'Chou',
      'Chou',
      7,
    ),
  ];
  List<String> tabs = [
    "Fruits",
    "Mushroom",
    "Dairy",
    "Oats",
    "Vegetables",
    "Bread",
    "Rice",
    "Egg"
  ];
  // int current = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) => Stack(children: [
            Container(
              padding: EdgeInsets.only(
                  top: 85.r, right: 20.r, left: 20.r, bottom: 10.r),
              // margin: EdgeInsets.only(left: 20.r, top: 65.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Good Morning,",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 75, 67, 67),
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          userName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 10.r),
                          child: GestureDetector(
                            onTap: fetchUserData,
                            child: Icon(
                              Icons.notifications,
                              size: 25.h,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),

            /* Start List Categories */
            ProductsTab(products: products, context: context),
            /* End List Categories */
            Container(
              color: const Color(0xFFF0F0F0),
              margin: EdgeInsets.only(top: 140.r),
              padding: EdgeInsets.only(top: 10.r),
              width: double.infinity,
              height: 155.h,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 20.r),
                              child: Text(
                                'Categories',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ))),
                      Container(
                        margin: EdgeInsets.only(right: 20.r),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (BuildContextcontext,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) =>
                                    const Categories(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/Next.svg',
                            width: 25.sp,
                            // ignore: deprecated_member_use
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 90.h,
                    width: double.infinity,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: tabs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            // onTap: () {
                            //   setState(() {
                            //     currentTransaction = index;
                            //   });
                            // },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 13.r, left: 5.r, right: 5.r),
                                width: 95.w,
                                height: 70.h,
                                child: Card(
                                  elevation: 8.h,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icons/${tabs[index]}.svg',
                                      width: 50.sp,
                                      // ignore: deprecated_member_use
                                      color: const Color(0xFF7A1E76),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Container(
                color: Colors.white,
                width: double.infinity,
                height: 35.h,
                margin: EdgeInsets.only(top: 275.r),
                child: Text('')),
            Container(
                margin: EdgeInsets.only(left: 20.r, top: 280.r),
                child: Text(
                  'Latest Products',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ))
          ]),
        ),
        bottomNavigationBar:
            getFooters(callBackFunction: funChange, currentIndex: 0),
      ),
    );
  }
}
