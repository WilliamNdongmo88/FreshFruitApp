import 'package:flutter/material.dart';

import '../utils/MA_Widgets.dart';
import 'MA_DevisesPage.dart';
import 'MA_SettingsPage.dart';
import 'homePage/MA_homePage.dart';

class TransactionPage extends StatefulWidget {
  static const transactionpage = '/TransactionPage';
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => TransactionPageState();
}

class TransactionPageState extends State<TransactionPage> {

  int currentIndex = 0;
  void funChange(int changetxt) {
    setState(() {
      currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Page de details de transaction'),
      ),
      bottomNavigationBar: getFooter(callBackFunction: funChange, currentIndex:1),
    );
  }
}
