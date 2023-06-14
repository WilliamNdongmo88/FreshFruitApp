import 'package:flutter/material.dart';
import 'package:money_app/utils/MA_Constant.dart';
import 'package:get/get.dart';
import 'package:money_app/utils/MA_Styles.dart';
import 'package:money_app/utils/MA_TransactionItemDetails.dart';
import 'package:money_app/views/auth/MA_Login.dart';
import 'package:money_app/views/auth/MA_Signup.dart';
import 'package:money_app/views/homePage/MA_homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AppColors.mainAppColor),
      initialRoute: '/',
      routes: {
        TransactionListScreen.transactionListScreen: (context) => const TransactionListScreen(),
        TransactionScreen.transactionScreenPage: (context) => TransactionScreen(),
      },
      // home: TransactionListScreen(),
    );
  }
}




