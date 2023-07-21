// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/MA_CallableWidget.dart';
import '../utils/MA_TransactionItem.dart';
import '../utils/MA_TransactionItemDetails.dart';
import '../utils/MA_Widgets.dart';
import 'homePage/MA_homePage.dart';

class EditeData extends StatefulWidget {
  List<TransactionItem> transaction;
  int index;
  EditeData({super.key, required this.transaction, required this.index});

  @override
  State<EditeData> createState() =>
      _EditeDataState(this.transaction, this.index);
}

class _EditeDataState extends State<EditeData> {
  List<TransactionItem> transaction;
  int index;
  _EditeDataState(this.transaction, this.index);
  TextEditingController banqueNameController =
      TextEditingController(text: 'UBA');
  TextEditingController compteNameController =
      TextEditingController(text: '8475 1523 6589 2547');
  TextEditingController countryNameController =
      TextEditingController(text: 'Cameroun');
  TextEditingController numeroCompteController =
      TextEditingController(text: '012478635');
  TextEditingController codeReceptionController =
      TextEditingController(text: 'trans:062089');
  TextEditingController destinataireNameController =
      TextEditingController(text: 'Robert Boum');
  TextEditingController numeroTelephoneController =
      TextEditingController(text: '+23758697425');
  List listCountry = ['Cameoun', 'USA', 'Angland', 'Italie'];
  List listCities = ['Bafoussam', 'Yaoundé', 'Douala', 'Kribi', 'Bamenda'];
  var valueChoose;
  var valueCountryChoose;
  var valueCityChoose;
  int currentIndex = 0;
  void funChange(changetxt) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TransactionScreen(
              transaction: transaction,
              index: index,
              isListTransaction: true)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (contex, child) => SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(left: 20.r, top: 60.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 5),
                    child: buildIconButtonSvg(
                        iconSvg: 'assets/back.svg',
                        iconColor: const Color(0XFF000000),
                        fontSizeIcon: 35,
                        callBackFunction: funChange),
                  ),
                  Text(
                    'Modification de la transaction',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.r, left: 18.r, right: 18.r),
                // height: 690,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(25), //border corner radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1), //color of shadow
                      spreadRadius: 3, //spread radius
                      blurRadius: 3, // blur radius
                      offset: const Offset(-3, 3), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 20.r),
                        child: Text("Les informations de l'expéditeur",
                            style: GoogleFonts.inter(
                                fontSize: 22.sp, fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 25.r, right: 25.r),
                        child: Column(
                          children: [
                            outputField(
                              topTextLeft: "Nom de l'expéditeur",
                              bottomTextLeft: 'James Kora',
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            outputField(
                              topTextLeft: "Pays d'envoi",
                              bottomTextLeft: 'USA',
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            outputField(
                              topTextLeft: 'N° Téléphone',
                              bottomTextLeft: '+23765214789471',
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 18.r, right: 14.r),
                              child: Text(
                                  "Les informations sur le destinataire",
                                  style: GoogleFonts.inter(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Form(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (transaction[index].status ==
                                          'OPEN') ...[
                                        Container(
                                          margin: EdgeInsets.only(top: 10.r),
                                          child: Text("Nom du destinataire",
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      97, 97, 97, 1),
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          height: 35.h,
                                          child: TextFormField(
                                            controller:
                                                destinataireNameController,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)))),
                                            validator: (value) {
                                              if (value != null) {
                                                return 'Please enter a user';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text("Intitulé du compte",
                                            style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    97, 97, 97, 1),
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          height: 35.h,
                                          child: TextFormField(
                                            controller: compteNameController,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)))),
                                            validator: (value) {
                                              if (value != null) {
                                                return 'Please enter a user';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Pays",
                                                      style: TextStyle(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              97, 97, 97, 1),
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Container(
                                                    height: 35.h,
                                                    padding: EdgeInsets.only(
                                                        left: 10.r, right: 5.r),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              97, 97, 97, 1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: DropdownButton(
                                                        hint: Text(
                                                          "Cameroun",
                                                          style: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: const Color(
                                                                  0XFF000000)),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color:
                                                              Color(0XFFF24E1E),
                                                        ),
                                                        iconSize: 40.w,
                                                        underline:
                                                            const SizedBox(),
                                                        style:
                                                            GoogleFonts.inter(
                                                          color: const Color(
                                                              0XFF000000),
                                                        ),
                                                        value: valueChoose,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            valueChoose =
                                                                newValue;
                                                          });
                                                        },
                                                        items: listCountry.map(
                                                          (valueCountry) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueCountry,
                                                                child: Text(
                                                                  valueCountry,
                                                                  style: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ));
                                                          },
                                                        ).toList()),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("N° Compte",
                                                    style: TextStyle(
                                                        color: const Color
                                                                .fromRGBO(
                                                            97, 97, 97, 1),
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                SizedBox(
                                                  height: 35.h,
                                                  width: 140.w,
                                                  child: TextFormField(
                                                    controller:
                                                        numeroCompteController,
                                                    style: GoogleFonts.inter(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    decoration: const InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        5.0)))),
                                                    validator: (value) {
                                                      if (value != null) {
                                                        return 'Please enter a user';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ] else if (transaction[index].status ==
                                              'En Attente' ||
                                          transaction[index].status ==
                                              'Annulé') ...[
                                        Container(
                                          margin: EdgeInsets.only(top: 10.r),
                                          child: Text("Nom de la banque",
                                              style: TextStyle(
                                                  color: const Color.fromRGBO(
                                                      97, 97, 97, 1),
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        SizedBox(
                                          height: 35.h,
                                          child: TextFormField(
                                            controller: banqueNameController,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)))),
                                            validator: (value) {
                                              if (value != null) {
                                                return 'Please enter a user';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Text("N° Téléphone",
                                            style: TextStyle(
                                                color: const Color.fromRGBO(
                                                    97, 97, 97, 1),
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10.sp,
                                        ),
                                        SizedBox(
                                          height: 35.h,
                                          child: TextFormField(
                                            controller:
                                                numeroTelephoneController,
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold),
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0)))),
                                            validator: (value) {
                                              if (value != null) {
                                                return 'Please enter a user';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        SizedBox(height: 15.h),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Pays",
                                                      style: TextStyle(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              97, 97, 97, 1),
                                                          fontSize: 17.sp,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Container(
                                                    height: 35.h,
                                                    padding: EdgeInsets.only(
                                                        left: 10.r, right: 5.r),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color
                                                                  .fromRGBO(
                                                              97, 97, 97, 1)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: DropdownButton(
                                                        hint: Text(
                                                          "Cameroun",
                                                          style: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: const Color(
                                                                  0XFF000000)),
                                                        ),
                                                        icon: const Icon(
                                                          Icons.arrow_drop_down,
                                                          color:
                                                              Color(0XFFF24E1E),
                                                        ),
                                                        iconSize: 40.w,
                                                        underline:
                                                            const SizedBox(),
                                                        style:
                                                            GoogleFonts.inter(
                                                          color: const Color(
                                                              0XFF000000),
                                                        ),
                                                        value:
                                                            valueCountryChoose,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            valueCountryChoose =
                                                                newValue;
                                                          });
                                                        },
                                                        items: listCountry.map(
                                                          (valueCountry2) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueCountry2,
                                                                child: Text(
                                                                  valueCountry2,
                                                                  style: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ));
                                                          },
                                                        ).toList()),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Ville",
                                                    style: TextStyle(
                                                        color: const Color
                                                                .fromRGBO(
                                                            97, 97, 97, 1),
                                                        fontSize: 17.sp,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Container(
                                                  height: 35.h,
                                                  padding: EdgeInsets.only(
                                                      left: 10.r, right: 5.r),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color
                                                                .fromRGBO(
                                                            97, 97, 97, 1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: DropdownButton(
                                                      hint: Text(
                                                        "Yaoundé",
                                                        style: GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: const Color(
                                                                0XFF000000)),
                                                      ),
                                                      icon: const Icon(
                                                        Icons.arrow_drop_down,
                                                        color:
                                                            Color(0XFFF24E1E),
                                                      ),
                                                      iconSize: 40.w,
                                                      underline:
                                                          const SizedBox(),
                                                      style: GoogleFonts.inter(
                                                        color: const Color(
                                                            0XFF000000),
                                                      ),
                                                      value: valueCityChoose,
                                                      onChanged: (newValue) {
                                                        setState(() {
                                                          valueCityChoose =
                                                              newValue;
                                                        });
                                                      },
                                                      items: listCities.map(
                                                        (valueCity) {
                                                          return DropdownMenuItem(
                                                              value: valueCity,
                                                              child: Text(
                                                                valueCity,
                                                                style: GoogleFonts.inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ));
                                                        },
                                                      ).toList()),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                      SizedBox(height: 10.h),
                                      Text("Code de reception",
                                          style: TextStyle(
                                              color: const Color.fromRGBO(
                                                  97, 97, 97, 1),
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      SizedBox(
                                        height: 35.h,
                                        child: TextFormField(
                                          controller: codeReceptionController,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold),
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5.0)))),
                                          validator: (value) {
                                            if (value != null) {
                                              return 'Please enter a user';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    SizedBox(height: 15.h),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 170.w,
                            height: 45.h,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0XFFF24E1E),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TransactionScreen(
                                        transaction: transaction,
                                        index: index,
                                        isListTransaction: false)));
                              },
                              child: Text(
                                'Annuler',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: const Color(0xfffffffff),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 170.w,
                            height: 45.h,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0XFFF24E1E),
                              ),
                              onPressed: () {
                                setState(() {
                                  print('-------alertDialog-----');
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return showdialog(ctx: ctx);
                                      });
                                });
                              },
                              child: Text(
                                'Confirmer',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                  color: const Color(0xfffffffff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ),
      /* Tab Bar */
      bottomNavigationBar:
          getFooter(callBackFunction: funChange, currentIndex: 1),
    );
  }
}
