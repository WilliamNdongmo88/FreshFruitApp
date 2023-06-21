import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:money_app/views/settings/MA_Acceuil.dart';
import 'package:money_app/views/settings/MA_Devise.dart';
import 'package:money_app/views/settings/MA_Setting.dart';
import 'package:money_app/views/settings/MA_Transaction.dart';

// ignore: camel_case_types
class bottom_navigation_bar extends StatelessWidget {
  const bottom_navigation_bar({Key? key, required this.currentIndex})
      : super(key: key);

  final int currentIndex;
  /*
  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Color.fromARGB(255, 128, 130, 132)),
        ),
        // color: Colors.white,
      ),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => Acceuil()));
            } else if (index == 1) {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => Transaction()));
            } else if (index == 2) {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => Devise()));
            } else if (index == 3) {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => Setting()));
            }
          },
          selectedItemColor: Color(0xFFF24E1E),
          //unselectedItemColor: Colors.green,
          iconSize: 60,
          elevation: 60,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/icon_home.svg",
                  width: 25,
                  height: 25,
                  color:
                      currentIndex == 0 ? Color(0xFFF24E1E) : Color(0xFF000000),
                ),
                label: 'Accueil'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/icon_transaction.svg",
                  width: 25,
                  height: 25,
                  color:
                      currentIndex == 1 ? Color(0xFFF24E1E) : Color(0xFF000000),
                ),
                label: 'Transaction'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/icon_devise.svg",
                  width: 25,
                  height: 25,
                  color:
                      currentIndex == 2 ? Color(0xFFF24E1E) : Color(0xFF000000),
                ),
                label: 'Devises'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/icon_setting.svg",
                  width: 25,
                  height: 25,
                  color:
                      currentIndex == 3 ? Color(0xFFF24E1E) : Color(0xFF000000),
                ),
                label: 'Paramètre')
          ]),
    );
  }
}
