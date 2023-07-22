import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_app/utils/MA_Styles.dart';

import 'package:money_app/views/settings/MA_Acceuil.dart';
import 'package:money_app/views/settings/MA_Devise.dart';
import 'package:money_app/views/settings/MA_Setting.dart';
import 'package:money_app/views/settings/MA_Transaction.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding: EdgeInsets.only(top: 2.h, bottom: 10.h),
      decoration: BoxDecoration(
        border: Border(
          top:
              BorderSide(width: 1.w, color: Color.fromARGB(255, 128, 130, 132)),
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
          selectedItemColor: AppColors.orange,
          //unselectedItemColor: Colors.green,
          //iconSize: 80,
          elevation: 60.sp,
          selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter'),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/icon_home.svg",
                  width: 22.w,
                  height: 20.h,
                  color: currentIndex == 0 ? AppColors.orange : AppColors.dark,
                ),
                label: 'Accueil'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/icon_transaction.svg",
                  width: 22.w,
                  height: 20.h,
                  color: currentIndex == 1 ? AppColors.orange : AppColors.dark,
                ),
                label: 'Transaction'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/icon_devise.svg",
                  width: 22.w,
                  height: 20.h,
                  color: currentIndex == 2 ? AppColors.orange : AppColors.dark,
                ),
                label: 'Devises'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/icon_setting.svg",
                width: 22.w,
                height: 20.h,
                color: currentIndex == 3 ? AppColors.orange : AppColors.dark,
              ),
              label: 'Paramètre',
            )
          ]),
    );
  }
}
