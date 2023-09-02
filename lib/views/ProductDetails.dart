import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_app/utils/ProductItem.dart';

import '../utils/Widgets.dart';
import 'HomePage.dart';

class ProductDetails extends StatefulWidget {
  int index;
  List<ProductItem> products;
  ProductDetails({super.key, required this.products, required this.index});

  @override
  State<ProductDetails> createState() =>
      _ProductDetailsState(this.products, this.index);
}

class _ProductDetailsState extends State<ProductDetails> {
  var index;
  List<ProductItem> products;
  _ProductDetailsState(this.products, this.index);

  void funChange(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }

  late String userName;
  @override
  void initState() {
    userName = 'Rafatul islam';
    print('products index ---> $index');
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
                    Container(
                      height: 350.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/${products[index].image}.png"),
                            fit: BoxFit.cover),
                      ),
                      child: const Text(''),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100.r, left: 10.r),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) =>
                                  HomePage(token: 'token'),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/icons/Back.svg',
                          width: 25.sp,
                          // ignore: deprecated_member_use
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 300.r),
                        height: 500.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      products[index].name,
                                      style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                    width: 112.w,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(25.sp),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        // style: ElevatedButton.styleFrom(
                                        //   primary: const Color(0xFFEFEFEF), // Background color
                                        // ),
                                        child: Text(
                                          "Add to cart",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Row(children: [
                                Expanded(
                                    child: Text('\$${products[index].amount}',
                                        style: TextStyle(
                                            color: const Color(0xFFFEC54B),
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(
                                  height: 20.h,
                                  width: 112.w,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEFEFEF),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SvgPicture.asset(
                                            'assets/icons/min.svg',
                                            height: 4.h,
                                            // ignore: deprecated_member_use
                                            color: const Color(0xFFFEC54B),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text('3',
                                                style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontStyle: FontStyle.normal,
                                                  color: const Color.fromARGB(
                                                      255, 40, 38, 38),
                                                )),
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/icons/plus.svg',
                                          height: 40.h,
                                          // ignore: deprecated_member_use
                                          color: const Color(0xFFFEC54B),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                              SizedBox(
                                height: 10.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 3.w,
                                            color: const Color(0xFFFEC54B),
                                          ),
                                        ),
                                        // color: Colors.white,
                                      ),
                                      child: Text(
                                        'Description',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Lorem Ipsum est un générateur de faux textes aléatoires. Vous choisissez le nombre de paragraphes, de mots ou de listes. Vous obtenez alors un texte aléatoire que vous pourrez ensuite utiliser librement dans vos maquettes.Le texte généré est du pseudo latin et peut donner l'impression d'être du vrai texte.",
                                    style: TextStyle(fontSize: 14.sp),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            getFooters(callBackFunction: funChange, currentIndex: 0),
      ),
    );
  }
}
