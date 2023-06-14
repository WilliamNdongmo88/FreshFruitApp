import 'package:flutter/material.dart';
import 'package:money_app/utils/MA_Constant.dart';
import 'package:get/get.dart';
import 'package:money_app/views/auth/MA_Login.dart';
import 'package:money_app/views/auth/MA_Signup.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:money_app/views/settings/MA_Acceuil.dart';
import 'package:money_app/views/settings/MA_Devise.dart';
import 'package:money_app/views/settings/MA_Transaction.dart';
import 'package:money_app/views/settings/MA_Setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: [Acceuil(), Transaction(), Devise(), Setting()][_currentIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 1, color: Color.fromARGB(255, 128, 130, 132)),
            ),
            // color: Colors.white,
          ),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setCurrentIndex(index),
              selectedItemColor: Color(0xFFF24E1E),
              unselectedItemColor: Colors.green,
              iconSize: 60,
              elevation: 60,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/icon_home.svg",
                      width: 25,
                      height: 25,
                      color: _currentIndex == 0
                          ? Color(0xFFF24E1E)
                          : Color(0xFF000000),
                    ),
                    label: 'Accueil'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/icon_transaction.svg",
                      width: 25,
                      height: 25,
                      color: _currentIndex == 1
                          ? Color(0xFFF24E1E)
                          : Color(0xFF000000),
                    ),
                    label: 'Transaction'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/icon_devise.svg",
                      width: 25,
                      height: 25,
                      color: _currentIndex == 2
                          ? Color(0xFFF24E1E)
                          : Color(0xFF000000),
                    ),
                    label: 'Devises'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/icons/icon_setting.svg",
                      width: 25,
                      height: 25,
                      color: _currentIndex == 3
                          ? Color(0xFFF24E1E)
                          : Color(0xFF000000),
                    ),
                    label: 'Paramètre')
              ]),
        ),
      ),
    );
  }
}
