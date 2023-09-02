import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_app/views/Categories.dart';
import 'package:money_app/views/Favorite.dart';
import '../views/HomePage.dart';
import '../views/Profile.dart';
import '../views/ShoppingCart.dart';
import 'Styles.dart';
import 'ProductItem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class getFooters extends StatefulWidget {
  int currentIndex;
  final Function callBackFunction;
  getFooters(
      {super.key, required this.callBackFunction, required this.currentIndex});

  @override
  State<getFooters> createState() =>
      _getFootersState(this.callBackFunction, this.currentIndex);
}

class _getFootersState extends State<getFooters> {
  Function callBackFunction;
  int currentIndex;

  _getFootersState(this.callBackFunction, this.currentIndex);
  final tabs = ['Home', 'Categories', 'ShoppingCart', 'Favorite', 'Profile'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 70.r),
      // decoration: BoxDecoration(
      //   border: Border(
      //     top: BorderSide(
      //         width: 1.w, color: const Color.fromARGB(255, 128, 130, 132)),
      //   ),
      //   // color: Colors.white,
      // ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 15,
        // unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 0
                  ? AppColors.yellow
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/category.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 1
                  ? AppColors.yellow
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Frame.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 2
                  ? AppColors.yellow
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/favorite.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 3
                  ? AppColors.yellow
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ProfileIcon.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 4
                  ? AppColors.yellow
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print('currenrIndex--> $currentIndex');
            callBackFunction(currentIndex);
            if (index == 0) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      HomePage(token: 'token'),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            } else if (index == 1) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      const Categories(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      const ShoppingCart(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            } else if (index == 3) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      const Favorite(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            } else if (index == 4) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      const Profile(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            }
          });
        },
      ),
    );
  }
}
