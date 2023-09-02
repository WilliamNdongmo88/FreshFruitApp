import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/ProductItem.dart';
import 'HomePage.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, child) => Stack(
              children: [
                Container(
                  height: 250.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/orange_d.png"),
                        fit: BoxFit.cover),
                  ),
                  child: const Text(''),
                ),
                Container(
                  margin: EdgeInsets.only(top:50.r, left:10.r),
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
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
                Container(
                margin: EdgeInsets.only(top: 250.r),
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
                      Row(children: [
                          Expanded(
                            child: Text(
                              products[0].name,
                              style: TextStyle(
                                  fontSize: 22.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                            width: 112.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.sp),
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
                      SizedBox(height: 25.h,),
                      Row(children: [
                        Expanded(child: Text('\$${products[0].amount}', style: TextStyle(
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
                                        style: GoogleFonts.inter(
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
                                    width: 3.w, color: const Color(0xFFFEC54B),
                                  ),
                              ),
                              // color: Colors.white,
                            ),
                            child: Text('Description', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),)),
                            SizedBox(height: 10.h,),
                            Text(
                            "Lorem Ipsum est un générateur de faux textes aléatoires. Vous choisissez le nombre de paragraphes, de mots ou de listes. Vous obtenez alors un texte aléatoire que vous pourrez ensuite utiliser librement dans vos maquettes.Le texte généré est du pseudo latin et peut donner l'impression d'être du vrai texte.",
                            style: TextStyle(
                                fontSize: 14.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                )
                ),
              ],
            ),
      ),
    );
  }
}
