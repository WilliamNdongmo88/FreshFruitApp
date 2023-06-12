import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:money_app/utils/MA_Constant.dart';
import 'package:get/get.dart';
import 'package:money_app/utils/MA_TransactionItemDetails.dart';
import 'package:money_app/views/auth/MA_Login.dart';
import 'package:money_app/views/auth/MA_Signup.dart';
import 'package:money_app/views/homePage/MA_homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: mainAppColor),
      initialRoute: '/',
      routes: {
        TransactionListScreen.transactionListScreen: (context) => const TransactionListScreen(),
        TransactionScreen.transactionScreenPage: (context) => TransactionScreen(),
      },
      // home: TransactionListScreen(),
    );
  }
}




