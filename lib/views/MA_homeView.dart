import 'package:flutter/material.dart';

import '../utils/MA_Widgets.dart';
import 'MA_DevisesPage.dart';
import 'MA_SettingsPage.dart';
import 'MA_TransactionPage.dart';
import 'homePage/MA_homePage.dart';

class HomeWiewScreens extends StatefulWidget {
  static const homewiewscreens = '/';
  const HomeWiewScreens({super.key});

  @override
  State<HomeWiewScreens> createState() => _HomeWiewScreensState();
}

class _HomeWiewScreensState extends State<HomeWiewScreens> {
  int currentIndex = 0;

  static var index;
  static var check;

  void funChange(changetxt) {
    setState(() {
      currentIndex = changetxt;
    //   if (changetxt == 0) {
    //     Navigator.pushNamed(
    //         context, TransactionListScreen.transactionListScreen);
    //   } else if (changetxt == 1) {
    //     Navigator.pushNamed(context, TransactionPage.transactionpage);
    //   } else if (changetxt == 2) {
    //     Navigator.pushNamed(context, SettingsPage.settingspage);
    //   } else if (changetxt == 3) {
    //     Navigator.pushNamed(context, DevisesPage.devisespage);
    //   }
    });
  }

  final screens = [
    Container(child: TransactionListScreen(/*check: check*/)),
    Container(
      child: TransactionPage(index: index),
    ),
    Container(child: DevisesPage()),
    Container(
      child: SettingsPage(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      // bottomNavigationBar: getFooter(callBackFunction: funChange),
    );
  }
}
