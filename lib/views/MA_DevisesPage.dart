// ignore_for_file: prefer_typing_uninitialized_variables, sort_child_properties_last, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/MA_Widgets.dart';
import 'MA_SettingsPage.dart';
import 'MA_TransactionPage.dart';
import 'homePage/MA_homePage.dart';

class DevisesPage extends StatefulWidget {
  static const devisespage = '/DevisesPage';
  const DevisesPage({super.key});

  @override
  State<DevisesPage> createState() => _DevisesPageState();
}

class _DevisesPageState extends State<DevisesPage> {
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
  List listCountry = ['Cameoun', 'USA', 'Angland', 'Italie'];
  var selectedCountrySender;
  List<Map<String, String>> countryList = [
    {'name': 'Cameoun'},
    {'name': 'USA'},
    {'name': 'Angland'},
    {'name': 'Italie'}
  ];
  var valueTopChoose;
  var valueBottomChoose;
  int currentIndex = 0;
  List listDevises = ['USD', 'EUR', 'LIVRE', 'XFA'];
  var nameDeviseTop = "Dollar Americain";
  var nameDeviseBottom = "euro";
  var flagDevisesTop = "flag-united-states";
  var flagDevisesBottom = "flag-european-union";

  void funChange(changetxt) {
    setState(() {
      if (changetxt == 'WithoutLabel') {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) => TransactionListScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(top: 60.r),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.r, right: 10.r),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildIconButtonSvg(
                        iconSvg: 'assets/back.svg',
                        iconColor: const Color(0XFF000000),
                        fontSizeIcon: 40.sp,
                        callBackFunction: funChange,
                      ),
                      SizedBox(
                        width: 80.w,
                      ),
                      Text(
                        'Dévises',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.r, left: 18.r, right: 18.r),
                  height: 655.h,
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
                        offset:
                            const Offset(-3, 3), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                    ],
                  ),
                  child: Stack(children: [
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 20.r),
                            child: Text(
                              "Vos dévises en temps réel",
                              style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 5.r, left: 18.r, right: 18.r),
                            height: 260.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  25.w), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(1), //color of shadow
                                  spreadRadius: 3, //spread radius
                                  blurRadius: 3, // blur radius
                                  offset: const Offset(
                                      -3, 3), // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 30, 16, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3)),
                                      border: Border.all(
                                          color: Colors.grey,
                                          style: BorderStyle.solid),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 5.r),
                                          child: SvgPicture.asset(
                                            'assets/$flagDevisesTop.svg',
                                            placeholderBuilder: (context) =>
                                                const CircularProgressIndicator(),
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0.r, 5.r, 120.r, 0.r),
                                              child: Text(nameDeviseTop,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.sp,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              176,
                                                              171,
                                                              171))),
                                            ),
                                            DropdownButton(
                                                hint: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 0.r),
                                                  child: Text(
                                                    "USD",
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: const Color(
                                                            0XFF000000)),
                                                  ),
                                                ),
                                                icon: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 140.r),
                                                  child: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Color(0XFFF24E1E),
                                                  ),
                                                ),
                                                iconSize: 40,
                                                underline: const SizedBox(),
                                                style: const TextStyle(
                                                  color: Color(0XFF000000),
                                                ),
                                                value: valueTopChoose,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    valueTopChoose = newValue;
                                                    print(
                                                        'devise--> $valueTopChoose');
                                                    changeDevise(
                                                        valueTopChoose);
                                                  });
                                                },
                                                items: listDevises.map(
                                                  (valueCountry) {
                                                    return DropdownMenuItem(
                                                        value: valueCountry,
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0),
                                                          child: Text(
                                                            valueCountry,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ));
                                                  },
                                                ).toList()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25.h),
                                Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                        height: 60.h,
                                        width: 350.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  97, 97, 97, 1)),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              '3313.44',
                                              style: GoogleFonts.inter(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ))),
                              ],
                            )),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 18.r, right: 18.r),
                            height: 260.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  25), //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(1), //color of shadow
                                  spreadRadius: 3, //spread radius
                                  blurRadius: 3, // blur radius
                                  offset: const Offset(
                                      -3, 3), // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      16.r, 30.r, 16.r, 0.r),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3)),
                                      border: Border.all(
                                          color: Colors.grey,
                                          style: BorderStyle.solid),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 5.r),
                                          child: SvgPicture.asset(
                                            'assets/$flagDevisesBottom.svg',
                                            placeholderBuilder: (context) =>
                                                const CircularProgressIndicator(),
                                            height: 40.h,
                                            width: 40.w,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0.r, 5.r, 120.r, 0.r),
                                              child: Text(nameDeviseBottom,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.sp,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              176,
                                                              171,
                                                              171))),
                                            ),
                                            DropdownButton(
                                                hint: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 0),
                                                  child: const Text(
                                                    "EUR",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0XFF000000)),
                                                  ),
                                                ),
                                                icon: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 140.r),
                                                  child: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Color(0XFFF24E1E),
                                                  ),
                                                ),
                                                iconSize: 40,
                                                underline: const SizedBox(),
                                                style: const TextStyle(
                                                  color: Color(0XFF000000),
                                                ),
                                                value: valueBottomChoose,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    valueBottomChoose =
                                                        newValue;
                                                    print(
                                                        'devise--> $valueBottomChoose');
                                                    changeDeviseBottom(
                                                        valueBottomChoose);
                                                  });
                                                },
                                                items: listDevises.map(
                                                  (valueCountry) {
                                                    return DropdownMenuItem(
                                                        value: valueCountry,
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0),
                                                          child: Text(
                                                            valueCountry,
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ));
                                                  },
                                                ).toList()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25.h),
                                Padding(
                                    padding: EdgeInsets.all(16.r),
                                    child: Container(
                                        height: 60.h,
                                        width: 350.w,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  97, 97, 97, 1)),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              '3000',
                                              style: GoogleFonts.inter(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ))),
                              ],
                            )),
                      ],
                    ),
                    Positioned(
                      top: 318.r,
                      right: 50.r,
                      child: SvgPicture.asset(
                        'assets/exchange.svg',
                        width: 65.w,
                        height: 65.h,
                      ),
                    ),
                  ])),
            ]),
          ),
        ),
        /* Tab Bar */
        bottomNavigationBar:
            getFooter(callBackFunction: funChange, currentIndex: 2),
      ),
    );
  }

  changeDevise(valueTopChoose) {
    setState(() {
      switch (valueTopChoose) {
        case 'USD':
          nameDeviseTop = "Dollar Americain";
          flagDevisesTop = "flag-united-states";
          break;
        case 'XFA':
          nameDeviseTop = "Afrique Centrale";
          flagDevisesTop = "flag-european-union";
          break;
        case 'LIVRE':
          nameDeviseTop = "Lvre Anglaise";
          flagDevisesTop = "flag-european-union";
          break;
        default:
          nameDeviseTop = "Euro Europeen";
          flagDevisesTop = "flag-european-union";
      }
    });
  }

  changeDeviseBottom(valueBottomChoose) {
    setState(() {
      switch (valueBottomChoose) {
        case 'USD':
          nameDeviseBottom = "Dollar Americain";
          flagDevisesBottom = "flag-united-states";
          break;
        case 'XFA':
          nameDeviseBottom = "Afrique Centrale";
          flagDevisesBottom = "flag-european-union";
          break;
        case 'LIVRE':
          nameDeviseBottom = "Lvre Anglaise";
          flagDevisesBottom = "flag-european-union";
          break;
        default:
          nameDeviseBottom = "Euro Europeen";
          flagDevisesBottom = "flag-european-union";
      }
    });
  }
}
