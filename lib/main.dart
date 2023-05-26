import 'package:flutter/material.dart';
import 'package:money_app/utils/MA_Constant.dart';
import 'package:get/get.dart';
import 'package:money_app/views/auth/MA_Login.dart';
import 'package:money_app/views/auth/MA_Signup.dart';
import 'package:money_app/views/homePage/MA_homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
    MaterialColor mainAppColor = const MaterialColor(
    0xFFFF4500,
    <int, Color>{
      50: Color.fromRGBO(242, 78, 30, 1),
      100: Color.fromRGBO(242, 78, 30, 1),
      200: Color.fromRGBO(242, 78, 30, 1),
      300: Color.fromRGBO(242, 78, 30, 1),
      400: Color.fromRGBO(242, 78, 30, 1),
      500: Color.fromRGBO(242, 78, 30, 1),
      600: Color.fromRGBO(242, 78, 30, 1),
      700: Color.fromRGBO(242, 78, 30, 1),
      800: Color.fromRGBO(242, 78, 30, 1),
      900: Color.fromRGBO(242, 78, 30, 1),
    },
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mainAppColor),
      home: TransactionListScreen(),
    );
  }
}




