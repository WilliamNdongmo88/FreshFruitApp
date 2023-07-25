import 'package:flutter/material.dart';
import 'package:money_app/component/MA_BottomNavigationBar.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Devise'),
      ),
      bottomNavigationBar: bottom_navigation_bar(currentIndex: 0),
    );
  }
}
