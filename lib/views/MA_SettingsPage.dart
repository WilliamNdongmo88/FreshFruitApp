import 'package:flutter/material.dart';

import '../utils/MA_Widgets.dart';
import 'MA_DevisesPage.dart';
import 'MA_TransactionPage.dart';
import 'homePage/MA_homePage.dart';

class SettingsPage extends StatefulWidget {
  static const settingspage = '/SettingsPage';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        child: Text('Setting page'),
      ),
      bottomNavigationBar: getFooter(callBackFunction: funChange, currentIndex:3),
    );
  }
}