import 'package:flutter/material.dart';

import '../utils/MA_Widgets.dart';
import 'MA_SettingsPage.dart';
import 'MA_TransactionPage.dart';
import 'homePage/MA_homePage.dart';

class DevisesPage extends StatefulWidget {
  static const devisespage = '/DevisesPage';
  const DevisesPage({super.key});

  @override
  State<DevisesPage> createState() => _DevisesPageState();
}

class _DevisesPageState extends State<DevisesPage> {
  int currentIndex = 0;
  void funChange(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Devises page'),
      ),
      bottomNavigationBar: getFooter(callBackFunction: funChange),
    );
  }
}