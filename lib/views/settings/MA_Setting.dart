import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:money_app/utils/MA_Widgets.dart';
import 'package:money_app/views/settings/MA_UserProfil.dart';

import '../homePage/MA_homePage.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
  bool status = false;

  void funChange(changetxt) {
    setState(() {
      print('***********changetxt****** $changetxt');
      /*if (changetxt == 'WithoutLabel') {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) => TransactionListScreen(),
          ),
        );
      }*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        iconSize: 70.sp,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      TransactionListScreen()));
                        },
                        icon: SvgPicture.asset("assets/icons/icon_back.svg")),
                    SizedBox(
                      width: 40.w,
                    ),
                    Text(
                      "Paramètre",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 35.w)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const UserProfil()));
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/icon_name.svg",
                        width: 31.w,
                        height: 33.h,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const UserProfil()));
                    },
                    //padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Mr. la double violence',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          fontFamily: 'DM Sans',
                          letterSpacing: 0.1.sp,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 15.w, left: 20.w)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const UserProfil()));
                      },
                      icon: SvgPicture.asset(
                        "assets/icons/icon_profil.svg",
                        width: 31.w,
                        height: 33.h,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const UserProfil()));
                    },
                    child: Text(
                      'Mon profil',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          fontFamily: 'DM Sans',
                          letterSpacing: 0.1.sp,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 15.w, left: 20.w)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/icon_language.svg",
                        width: 31.w,
                        height: 33.h,
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Langue',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          fontFamily: 'DM Sans',
                          letterSpacing: 0.1.sp,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(right: 30.w, left: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/icon_points.svg",
                              width: 31.w,
                              height: 33.h,
                            )),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Mes points',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                fontFamily: 'DM Sans',
                                letterSpacing: 0.1.sp,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Text(
                      '120 points',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1.sp,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(right: 30.w, left: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/icon_notification.svg",
                              width: 31.w,
                              height: 33.h,
                            )),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Notifications',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.1.sp,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    FlutterSwitch(
                      activeColor: const Color(0xFFF24E1E),
                      width: 40.0.w,
                      height: 20.0.h,
                      valueFontSize: 12.0.sp,
                      toggleSize: 18.0.sp,
                      value: status,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                        print('value toggle $status ');
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.only(right: 30.w, left: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/icon_status.svg",
                              width: 31.w,
                              height: 33.h,
                            )),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Status du compte',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.1.sp,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Activé',
                      style: TextStyle(
                        color: Color(0xFF008000),
                        fontSize: 14.sp,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 15.w, left: 20.w)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/icon_comment.svg",
                        width: 31.w,
                        height: 33.h,
                      )),
                  TextButton(
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          contentPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.zero,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/icon_commentalert.svg",
                                width: 26.w,
                                height: 26.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'Commentaires sur l’application',
                                  style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontFamily: "DM Sans",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.1.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          content: SizedBox(
                            height: 137.h,
                            width: 100.w,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 15.w,
                                      left: 25.w,
                                      top: 10.h,
                                      bottom: 10.h),
                                  child: Text(
                                    'Avez-vous des suggestions ou des commentaire à faire sur notre applications?\nnous vous écoutons:',
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      //height: 1.7,
                                      fontFamily: "DM Sans",
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.1.sp,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF6F6F6F))),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFF6F6F6F)))),
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 30.w),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFF2F1F1),
                                    foregroundColor: const Color(0xFF6F6F6F)),
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text(
                                  'Annuler',
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 30.w),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFF24E1E),
                                    foregroundColor: const Color(0xFF000000)),
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: Text(
                                  'Soumettre',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Inter"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Commentaires sur l’application',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1.sp,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 15.w, left: 20.w)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/icon_help.svg",
                        width: 31.w,
                        height: 33.h,
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Aide',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1.sp,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 15.w, left: 20.w)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/icon_aboutus.svg",
                        width: 31.w,
                        height: 33.h,
                      )),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'A propos',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1.sp,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: getFooter(
            callBackFunction: funChange,
            currentIndex: 3), //const bottom_navigation_bar(currentIndex: 3),
      ),
    );
  }
}
