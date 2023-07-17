import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_app/utils/MA_Styles.dart';
import 'package:money_app/views/settings/MA_UserProfil.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/MA_BottomNavigationBar.dart';
import '../../utils/MA_Widgets.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key, required this.title});

  final String title;

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final _formKey = GlobalKey<FormState>();
  bool onError = false;

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final paysController = TextEditingController();
  final villeController = TextEditingController();
  final telephoneController = TextEditingController();

  String nn = 'Text';
  //Sttt = 'TextInputType.Text';
  //String testinputtype = "$tt.$nn";

  @override
  void dispose() {
    super.dispose();

    nomController.dispose();
    prenomController.dispose();
    emailController.dispose();
    paysController.dispose();
    villeController.dispose();
    telephoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
          ),*/
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 10.w, right: 80.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 70.sp,
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const UserProfil()));
                        },
                        icon: SvgPicture.asset("assets/icons/icon_back.svg")),
                    Text(
                      "Modifier profil",
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
                height: 10.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.text,
                          textLabel: 'Nom',
                          textHint: 'lisa balae',
                          icon: "assets/icons/icon_name.svg",
                          textObscure: false,
                          controller: nomController,
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
                              padding: EdgeInsets.only(right: 153.w),
                              child: Text('Veuillez entrer votre Nom',
                                  style: TextStyle(
                                      color: AppColors.orange,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'DM Sans',
                                      letterSpacing: 0.1.sp)),
                            ))
                        : Container(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.text,
                          textLabel: 'Prenom',
                          textHint: 'Camilla',
                          icon: "assets/icons/icon_name.svg",
                          textObscure: false,
                          controller: prenomController,
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
                        ? myerrorMessage(
                            text: 'Veuillez entrer votre Prénom',
                            paddingerror: 130.w)
                        : Container(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.emailAddress,
                          textLabel: 'Email',
                          textHint: 'lisaCamila@gmail.com',
                          icon: "assets/icons/icon_email.svg",
                          textObscure: false,
                          controller: emailController,
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
                        ? myerrorMessage(
                            text: 'Veuillez entrer votre Email',
                            paddingerror: 147.w)
                        : Container(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.text,
                          textLabel: 'Pays',
                          textHint: 'Cameroun',
                          icon: "assets/icons/icon_country.svg",
                          textObscure: false,
                          controller: paysController,
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
                        ? myerrorMessage(
                            text: 'Veuillez entrer votre Pays',
                            paddingerror: 149.w)
                        : Container(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.text,
                          textLabel: 'Ville',
                          textHint: 'Yaounde',
                          icon: "assets/icons/icon_locationcity.svg",
                          textObscure: false,
                          controller: villeController,
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
                        ? myerrorMessage(
                            text: 'Veuillez entrer votre Ville',
                            paddingerror: 154.w)
                        : Container(),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.w),
                      child: Container(
                        height: 70.h,
                        child: myTextFormField2(
                          keyboadtypeinput: TextInputType.phone,
                          textLabel: 'Téléphone',
                          textHint: '+237 691 886 084',
                          icon: "assets/icons/icon_phone.svg",
                          textObscure: false,
                          controller: telephoneController,
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
                        ? myerrorMessage(
                            text: 'Veuillez entrer votre numéro de Téléphone',
                            paddingerror: 40.w)
                        : Container(),
                    SizedBox(
                      height: 47.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 28.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: 50.h,
                              width: 161.w,
                              child: elevatedButton3(
                                  text: 'Modifier',
                                  onpress: () {
                                    if (_formKey.currentState!.validate()) {
                                      print('formulaire envoye');
                                      final pName = nomController.text;
                                      final pPrenom = prenomController.text;
                                      final pEmail = emailController.text;
                                      final pPays = paysController.text;
                                      final pVille = villeController.text;
                                      final pTelephone =
                                          telephoneController.text;

                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      /*print(pName +
                                    ' ' +
                                    pPrenom +
                                    ' ' +
                                    pEmail +
                                    ' ' +
                                    pPays +
                                    ' ' +
                                    pVille +
                                    ' ' +
                                    pTelephone);*/
                                    }
                                  })),
                          SizedBox(
                            width: 14.w,
                          ),
                          SizedBox(
                              height: 50.h,
                              width: 161.w,
                              child: elevatedButton3(
                                  text: 'Annuler',
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
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: const bottom_navigation_bar(currentIndex: 3),
      ),
    );
  }
}
