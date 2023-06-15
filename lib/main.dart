import 'package:flutter/material.dart';
import 'package:money_app/utils/MA_Styles.dart';
import 'package:money_app/views/homePage/MA_homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var check;


  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AppColors.mainAppColor),
      // initialRoute: '/',
      // routes: {
      //   // HomeWiewScreens.homewiewscreens :(context) => const HomeWiewScreens(),
      //   TransactionListScreen.transactionListScreen: (context) => TransactionListScreen(check: myMap),
      //   TransactionScreen.transactionScreenPage: (context) => TransactionScreen(transaction: value, myMap: myMap),
      //   TransactionPage.transactionpage: (context) => TransactionPage(index: index),
      //   SettingsPage.settingspage: (context) => const SettingsPage(),
      //   DevisesPage.devisespage: (context) => DevisesPage(),
      // },
      home: TransactionListScreen(check: check,),
    );
  }
}




