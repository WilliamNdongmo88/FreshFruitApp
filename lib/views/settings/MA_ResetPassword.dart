import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_app/utils/MA_Styles.dart';
import 'package:money_app/views/settings/MA_EditProfil.dart';
import 'package:money_app/views/settings/MA_UserProfil.dart';

import '../../utils/MA_Widgets.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  bool onError = false;

  final ancienMotDepasse = TextEditingController();
  final nouveauMotDePasse = TextEditingController();
  final confirmerMotDePasse = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    ancienMotDepasse.dispose();
    nouveauMotDePasse.dispose();
    confirmerMotDePasse.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //titleBar(text: "nnnn", nn: UserProfil(), ct: context),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 130.w),
                child: SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Image.asset("assets/images/logo_app.png"),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 33.h,
                      width: 316.w,
                      child: Text(
                        'Réinitialiser  votre mot de passe',
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 43.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.text,
                          textLabel: 'Ancien mot de passe',
                          textHint: '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                          icon: "assets/icons/icon_lock.svg",
                          textObscure: true,
                          controller: ancienMotDepasse,
                          validator: (value) {
                            setState(() {
                              onError = false;
                            });
                            if (value!.isEmpty) {
                              setState(() {
                                onError = true;
                              });
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    onError
                        ? Positioned(
                            bottom: 0.h,
                            child: Padding(
                              padding: EdgeInsets.only(right: 107.w),
                              child: Text('Veillez entrer votre mot de passe',
                                  style: TextStyle(
                                      color: AppColors.orange,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'DM Sans',
                                      letterSpacing: 0.1.sp)),
                            ))
                        : Container(),
                    SizedBox(height: 15.h),
                    Text(
                      "Choisissez un mot de passe sécurisé .",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1.sp,
                      ),
                    ),
                    Text(
                      "Niveau de sécurité du mot de passe : \nUtilisez au moins 8 caractères.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1.sp,
                          height: 1.5.sp),
                    ),
                    SizedBox(height: 16.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 43.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.text,
                          textLabel: 'Nouveau mot de passe',
                          textHint: '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                          icon: "assets/icons/icon_lock.svg",
                          textObscure: true,
                          controller: nouveauMotDePasse,
                          validator: (value) {
                            setState(() {
                              onError = false;
                            });
                            if (value!.isEmpty) {
                              setState(() {
                                onError = true;
                              });
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    onError
                        ? Positioned(
                            bottom: 0.h,
                            child: Padding(
                              padding: EdgeInsets.only(right: 65.w),
                              child: Text(
                                  'Veuillez entrer un mot de passe correct',
                                  style: TextStyle(
                                      color: AppColors.orange,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'DM Sans',
                                      letterSpacing: 0.1.sp)),
                            ))
                        : Container(),
                    SizedBox(height: 22.h),
                    Text(
                      "Les deux mots de passe doivent être \nidentique",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1.sp,
                          height: 1.5.sp),
                    ),
                    SizedBox(height: 14.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 43.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.text,
                          textLabel: 'Confirmer votre mot de passe',
                          textHint: '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                          icon: "assets/icons/icon_lock.svg",
                          textObscure: true,
                          controller: confirmerMotDePasse,
                          validator: (value) {
                            setState(() {
                              onError = false;
                            });
                            if (value!.isEmpty) {
                              setState(() {
                                onError = true;
                              });
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    onError
                        ? Positioned(
                            bottom: 0.h,
                            child: Padding(
                              padding: EdgeInsets.only(right: 17.w),
                              child: Text(
                                  'Les deux mots de passe ne sont pas identique',
                                  style: TextStyle(
                                      color: AppColors.orange,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'DM Sans',
                                      letterSpacing: 0.1.sp)),
                            ))
                        : Container(),
                    SizedBox(height: 70.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //elevatedButton2(text: "Confirmer", onpress: () {}),
                          SizedBox(
                              width: 161.w,
                              height: 50.h,
                              child: elevatedButton2(
                                  text: "Confirmer",
                                  onpress: () {
                                    if (_formKey.currentState!.validate()) {
                                      final rpAncien = ancienMotDepasse.text;
                                      final rpNouveau = nouveauMotDePasse.text;
                                      final rpConfirmer =
                                          confirmerMotDePasse.text;

                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      /*
                                  print(rpAncien +
                                      ' ' +
                                      rpNouveau +
                                      ' ' +
                                      rpConfirmer);
                                      */
                                    }
                                  })),
                          SizedBox(width: 5.w),
                          SizedBox(
                              width: 161.w,
                              height: 50.h,
                              child: elevatedButton2(
                                  text: "Annuler",
                                  onpress: () {
                                    Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                const UserProfil()));
                                  }))
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
