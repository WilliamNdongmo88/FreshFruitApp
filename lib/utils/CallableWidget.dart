// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state, unnecessary_this, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/ProductDetails.dart';
import 'ProductItem.dart';
import 'Widgets.dart';

class ProductsTab extends StatefulWidget {
  var context;
  List<ProductItem> products;

  ProductsTab({Key? key, required this.products, required this.context})
      : super(key: key);

  @override
  State<ProductsTab> createState() =>
      _ProductsTabState(this.products, this.context);
}

class _ProductsTabState extends State<ProductsTab> {
  var context;
  List<ProductItem> products;
  List<bool> isLikedList = [];
  int count = 0;

  _ProductsTabState(this.products, this.context) {
    isLikedList = List.generate(products.length, (index) => false);
  }

  void changeColor(int index) {
    setState(() {
      if (isLikedList[index]) {
        isLikedList[index] = false;
        count -= 1;
      } else {
        isLikedList[index] = true;
        count += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 170.r),
      child: Container(
        margin: EdgeInsets.only(top: 110.r),
        height: 705.h,
        child: SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(products.length, (index) {
              final product = products[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          changeColor(index);
                          print("Indice courant : $index");
                          print("count -------> $count");
                          print(" Change color heart");
                        },
                        child: SvgPicture.asset(
                          'assets/icons/heart.svg',
                          width: 18.0,
                          color: isLikedList[index]
                              ? const Color(0xFFFF0000)
                              : const Color(0xFFB1B1B1),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) =>
                                  ProductDetails(
                                      products: products, index: index),
                            ),
                          );
                          print("Indice courant : $index");
                        },
                        child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${product.image}.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\$${product.amount}',
                              style: const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text(
                            'Add to cart',
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF0000),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}


Widget CategoriesTab(List tab) {
  return Padding(
      padding: EdgeInsets.only(top: 25.r),
      child: Container(
        margin: EdgeInsets.only(top: 100.r),
        height: 705.h,
        child: SingleChildScrollView(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 18.0,
            mainAxisSpacing: 18.0,
            childAspectRatio: 0.85,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(tab.length, (index) {
              final product = tab[index];
              return GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   PageRouteBuilder(
                  //     pageBuilder: (BuildContext context,
                  //             Animation<double> animation,
                  //             Animation<double> secondaryAnimation) =>
                  //         ProductDetails(products: products, index: index),
                  //   ),
                  // );
                  print("Indice courant : $index");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                      const BoxShadow(
                        color: Colors.transparent,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(-2, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/${tab[index]}.svg',
                          width: 90.w,
                          color: const Color(0xFFE67F1E),
                        ),
                        SizedBox(height: 5.h),
                        Padding(
                          padding: EdgeInsets.only(left: 30.r),
                          child: Text(
                            '${tab[index]}',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFE67F1E)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ));
}

Widget shoppingcart(List<ProductItem> products) {
  return Padding(
    padding: EdgeInsets.only(top: 20.r),
    child: Container(
      margin: EdgeInsets.only(top: 110.r),
      height: 730.h,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Allshoppingcart(product),
            // cardItem(transaction: transaction),
            // onTap: () {
            //   print(
            //       'tansactionAnnuler---> onTap From MA_TransactionPage Inside  MA_callableWidget----');
            //   Navigator.of(context).push(
            //     PageRouteBuilder(
            //       pageBuilder: (BuildContext context,
            //               Animation<double> animation,
            //               Animation<double> secondaryAnimation) =>
            //           TransactionScreen(
            //               transaction: transactions,
            //               index: index,
            //               isListTransaction: isListTransaction),
            //     ),
            //   );
            // },
          );
        },
      ),
    ),
  );
}

Widget Allshoppingcart(product) {
  // print('transaction status ---> ${transaction.status}');
  // print('--------> statut ${transaction.icon}');
  return Container(
    padding: EdgeInsets.only(left: 5.r, right: 8.r, top: 5.r, bottom: 5.r),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 2.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0.sp),
                          child: Container(
                            height: 110.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${product.image}.png'),
                                fit: BoxFit.fill,
                              ),
                              // shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Fruit',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontStyle: FontStyle.normal,
                                  color:
                                      const Color.fromARGB(255, 136, 134, 134),
                                ),
                              ),
                              Text(
                                product.name,
                                style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                '\$${product.amount.toString()}',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFE67F1E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 13.h),
                        Padding(
                          padding: EdgeInsets.only(top: 55.r),
                          child: SizedBox(
                            height: 20.h,
                            width: 112.r,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 233, 233, 233),
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
                                      color: const Color(0xFFB1B1B1),
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
                                    color: const Color(0xFFB1B1B1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget FavoriteCart(List<ProductItem> products) {
  return Padding(
    padding: EdgeInsets.only(top: 30.r),
    child: Container(
      margin: EdgeInsets.only(top: 110.r),
      height: 730.h,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: AllFavoriteCart(product),
            // cardItem(transaction: transaction),
            // onTap: () {
            //   print(
            //       'tansactionAnnuler---> onTap From MA_TransactionPage Inside  MA_callableWidget----');
            //   Navigator.of(context).push(
            //     PageRouteBuilder(
            //       pageBuilder: (BuildContext context,
            //               Animation<double> animation,
            //               Animation<double> secondaryAnimation) =>
            //           TransactionScreen(
            //               transaction: transactions,
            //               index: index,
            //               isListTransaction: isListTransaction),
            //     ),
            //   );
            // },
          );
        },
      ),
    ),
  );
}

Widget AllFavoriteCart(product) {
  // print('transaction status ---> ${transaction.status}');
  // print('--------> statut ${transaction.icon}');
  return Container(
    padding: EdgeInsets.only(left: 5.r, right: 8.r, top: 5.r, bottom: 5.r),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 2.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0.sp),
                          child: Container(
                            height: 110.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${product.image}.png'),
                                fit: BoxFit.fill,
                              ),
                              // shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                product.name,
                                style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 50.h),
                              Text(
                                '\$${product.amount.toString()}',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFE67F1E),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 13.h),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5.r),
                              child: SvgPicture.asset(
                                'assets/icons/heart.svg',
                                height: 20.h,
                                // ignore: deprecated_member_use
                                color: const Color(0xFFFF2E6C),
                              ),
                            ),
                            SizedBox(height: 0.h),
                            Padding(
                              padding: EdgeInsets.only(top: 55.r),
                              child: SizedBox(
                                height: 20.h,
                                width: 112.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25.sp),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(
                                          0xFFEFEFEF), // Background color
                                    ),
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
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget ItemDetails() {
  return Row(
    children: [
      Expanded(
        child: Text(
          "Fresh Orange",
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
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
  );
}
