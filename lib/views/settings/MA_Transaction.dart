import 'package:flutter/material.dart';
import 'package:money_app/component/MA_BottomNavigationBar.dart';

class Transaction extends StatelessWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Transaction'),
      ),
      bottomNavigationBar: bottom_navigation_bar(currentIndex: 1),
    );
  }
}
