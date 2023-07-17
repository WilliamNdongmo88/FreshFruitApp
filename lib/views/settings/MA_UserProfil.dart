import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:money_app/component/MA_BottomNavigationBar.dart';
import 'package:money_app/utils/MA_Widgets.dart';
import 'package:money_app/views/settings/MA_Setting.dart';
import 'package:money_app/views/settings/MA_EditProfil.dart';
import 'package:money_app/views/settings/MA_ResetPassword.dart';

//MA_EditProfil
class UserProfil extends StatelessWidget {
  const UserProfil({Key? key}) : super(key: key);
  final ttext = 'norel aboty';
  final isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 150.w, left: 65.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        iconSize: 50.sp,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const Setting()));
                        },
                        icon: SvgPicture.asset("assets/icons/icon_back.svg")),
                    Text(
                      "Mon profil",
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
                height: 156.h,
                width: 154.w,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/user_image.png"),
                    ),
                    Positioned(
                      right: 2.w,
                      bottom: -5.h,
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/icon_photo.svg",
                            width: 26.w,
                            height: 30.h,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 55.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Nom',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF6F6F6F),
                              letterSpacing: 0.1.sp),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'lisaCamila',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF000000),
                              letterSpacing: 0.1.sp),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.h),
                          //Text(''),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const EditProfil(
                                              title: 'test page',
                                            )));
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/icon_edit.svg",
                                width: 24.w,
                                height: 24.h,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 55.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF6F6F6F),
                              letterSpacing: 0.1.sp),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'norelabotyi4@gmail',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF000000),
                              letterSpacing: 0.1.sp),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.h),
                          //Text(''),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const EditProfil(
                                              title: 'test page',
                                            )));
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/icon_edit.svg",
                                width: 24.w,
                                height: 24.h,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 55.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Pays',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF6F6F6F),
                              letterSpacing: 0.1.sp),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Yaounde, Cameroun',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF000000),
                              letterSpacing: 0.1.sp),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.h),
                          //Text(''),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const EditProfil(
                                              title: 'test page',
                                            )));
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/icon_edit.svg",
                                width: 24.w,
                                height: 24.h,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 55.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Téléphone',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF6F6F6F),
                              letterSpacing: 0.1.sp),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '+237 691 886 084',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF000000),
                              letterSpacing: 0.1.sp),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.h),
                          //Text(''),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const EditProfil(
                                              title: 'test page',
                                            )));
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/icon_edit.svg",
                                width: 24.w,
                                height: 24.h,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 40.w, left: 55.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Mot de passe',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF6F6F6F),
                              letterSpacing: 0.1.sp),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF000000),
                              letterSpacing: 0.1.sp),
                        ),
                      ],
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 5.h),
                          //Text(''),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            const ResetPassword()));
                              },
                              icon: SvgPicture.asset(
                                "assets/icons/icon_edit.svg",
                                width: 24.w,
                                height: 24.h,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/icon_dwonload.svg",
                          width: 30.w,
                          height: 23.h,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Modifier pièce d’identité",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans',
                            letterSpacing: 0.1.sp),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                actionsPadding: EdgeInsets.zero,
                                insetPadding: EdgeInsets.zero,
                                actionsAlignment: MainAxisAlignment.center,
                                contentPadding: EdgeInsets.zero,
                                titlePadding: EdgeInsets.zero,
                                alignment: Alignment.center,

                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20.w),
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: SvgPicture.asset(
                                                "assets/icons/icon_personadddesable.svg",
                                                width: 31.w,
                                                height: 32.h,
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Souhaitez-vous desactiver\nvotre compte?',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                //content: const Text('AlertDialog description'),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30.w,
                                          vertical: 15.h,
                                        ),
                                        backgroundColor:
                                            const Color(0xFFF2F1F1),
                                        foregroundColor:
                                            const Color(0xFF6F6F6F)),
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: Text(
                                      'Non',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter'),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 30.w,
                                          vertical: 15.h,
                                        ),
                                        backgroundColor:
                                            const Color(0xFFF24E1E),
                                        foregroundColor:
                                            const Color(0xFF000000)),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: Text(
                                      'Oui',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        icon: SvgPicture.asset(
                          "assets/icons/icon_person+.svg",
                          width: 31.w,
                          height: 33.h,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Text(
                        "Desactiver votre compte",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans',
                            letterSpacing: 0.1.sp),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 39.w),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(
                    height: 50.h,
                    child: elevatedButton2(
                      text: 'Se deconnecter',
                      onpress: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          actionsPadding: EdgeInsets.zero,
                          insetPadding: EdgeInsets.zero,
                          actionsAlignment: MainAxisAlignment.center,
                          contentPadding: EdgeInsets.zero,
                          titlePadding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          title: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    "assets/icons/icon_cancel.svg",
                                    width: 29.w,
                                    height: 30.h,
                                  )),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h, left: 10.w),
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: Text(
                                    'Déconnexion',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: Text('Vous allez être déconnecté !',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6F6F6F)),
                                      textAlign: TextAlign.center),
                                ),
                              )
                            ],
                          ),
                          //const Text('Vous allez être déconnecter !'),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      top: 15.h,
                                      right: 30.w,
                                      bottom: 15.h,
                                      left: 30.w),
                                  backgroundColor: const Color(0xFFF2F1F1),
                                  foregroundColor: const Color(0xFF6F6F6F)),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Text(
                                'Annuler',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      top: 15.h,
                                      right: 35.w,
                                      bottom: 15.h,
                                      left: 35.w),
                                  backgroundColor: const Color(0xFFF24E1E),
                                  foregroundColor: const Color(0xFF000000)),
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: Text(
                                'Oui',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Inter'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
        bottomNavigationBar: const bottom_navigation_bar(currentIndex: 3),
      ),
    );
  }
}
