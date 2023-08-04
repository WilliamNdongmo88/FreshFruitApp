// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/Helper classes/MA_Helper_City.dart';
import '../controller/Helper classes/MA_Helper_Country.dart';
import '../controller/MA_DataController.dart';
import '../utils/MA_CallableWidget.dart';
import '../utils/MA_Styles.dart';
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
  TextEditingController banqueNameController = TextEditingController();
  TextEditingController compteIntituleController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController numeroCompteController =
      TextEditingController(text: '012478635');
  TextEditingController codeReceptionController = TextEditingController();
  TextEditingController destinataireNameController = TextEditingController();
  TextEditingController numeroTelephoneController = TextEditingController();
  List listCountryCode = [];
  List listCountry = []; //
  List listCities = []; //
  var valueChoose;
  var valueCountryChoose;
  var valueCityChoose;
  int currentIndex = 0;
  List<TransactionItem> transactions = [];
  Map inputData = {};

  List countryData = [];
  Future<void> retrieveCountry() async {
    DataController dataController = DataController();
    countryData = await dataController.retrieveCountry();
    getAllCountry(countryData);
  }

  void getAllCountry(country) {
    setState(() {
      for (int? i = 0; i! < country.length; i++) {
        listCountry.add(country[i].name);
        for (int? j = 0; j! < country[i].cities.length; j++) {
          listCities.add(country[i].cities[j].name);
          listCountryCode.add(country[i].cities[j].code);
        }
      }
    });
    print('++++ listCountry---> $listCountry');
    print('++++ listCities---> $listCities');
    print('++++ listCountryCode---> $listCountryCode');
  }

  var isSpinner = false;
  List dataUpdade = [];
  Future<void> retrieveOneTransfert() async {
    print('dataUpdade ---> $dataUpdade');
    DataController dataController = DataController();
    dataUpdade = (await dataController.retrieveOneTransfert(
        transfert: transaction[index]));
    if (dataUpdade.isEmpty) {
      isSpinner = true;
      print('++++++++ isSpinner---> $isSpinner');
    } else {
      if (dataUpdade[0].to_bank) {
        print('++++++++ bankName---> ${dataUpdade[0].bank['nom']}');
      } else {
        print('++++++++ receiverName---> ${dataUpdade[0].receiver['nom']}');
      }
      print('++++++++ toBank ---> ${transaction[index].toBank}');
    }
  }

  void initState() {
    super.initState();
    retrieveCountry();
    print('++++ outZoneCity ---> ${transaction[index].outZoneCountry}');
    print('++++ tobank ---> ${transaction[index].toBank}');
    print('++++ status ---> ${transaction[index].status}');
    if (transaction[index].status == 'OPEN' &&
        transaction[index].toBank == true) {
      print('++++ tobank ---> ${transaction[index].toBank}');
      print('++++ bankNom ---> ${transaction[index].bankNom}');
      print('++++ intitule ---> ${transaction[index].bankIntitule}');
      countryNameController.text = transaction[index].inZoneCountry!;
      //numeroCompteController.text = transaction[index].bankNumber;
      compteIntituleController.text = transaction[index].bankIntitule as String;
      banqueNameController.text = transaction[index].bankNom as String;
      codeReceptionController.text =
          'trans:${transaction[index].codeReception}';
    } else if (transaction[index].status == 'OPEN' &&
        transaction[index].toBank == false) {
      print('++++Receivername true---> ${transaction[index].receiverName}');
      print('++++Receivertel true---> ${transaction[index].receiverTel}');
      print('++++codeReception true---> ${transaction[index].codeReception}');
      countryNameController.text = transaction[index].inZoneCountry!;
      destinataireNameController.text =
          transaction[index].receiverName as String;
      numeroTelephoneController.text = transaction[index].receiverTel as String;
      codeReceptionController.text =
          'trans:${transaction[index].codeReception}';
    } else if (transaction[index].status == 'CANCELED' &&
        transaction[index].toBank == true) {
      print('++++ tobank ---> ${transaction[index].toBank}');
      print('++++ bankNom ---> ${transaction[index].bankNom}');
      print('++++ intitule ---> ${transaction[index].bankIntitule}');
      countryNameController.text = transaction[index].inZoneCountry!;
      // //
      compteIntituleController.text = transaction[index].bankIntitule as String;
      banqueNameController.text = transaction[index].bankNom as String;
      codeReceptionController.text =
          'trans:${transaction[index].codeReception}';
    } else if (transaction[index].status == 'CANCELED' &&
        transaction[index].toBank == false) {
      countryNameController.text = transaction[index].inZoneCountry!;
      destinataireNameController.text =
          transaction[index].receiverName as String;
      numeroTelephoneController.text = transaction[index].receiverTel as String;
      codeReceptionController.text =
          'trans:${transaction[index].codeReception}';
    } else if (transaction[index].status == 'IN APPROVAL' &&
        transaction[index].toBank == true) {
      print('++++ tobank ---> ${transaction[index].toBank}');
      print('++++ bankNom ---> ${transaction[index].bankNom}');
      print('++++ intitule ---> ${transaction[index].bankIntitule}');
      countryNameController.text = transaction[index].inZoneCountry!;
      // //
      compteIntituleController.text = transaction[index].bankIntitule as String;
      banqueNameController.text = transaction[index].bankNom as String;
      codeReceptionController.text =
          'trans:${transaction[index].codeReception}';
    } else if (transaction[index].status == 'IN APPROVAL' &&
        transaction[index].toBank == false) {
      countryNameController.text = transaction[index].inZoneCountry!;
      destinataireNameController.text =
          transaction[index].receiverName as String;
      numeroTelephoneController.text = transaction[index].receiverTel as String;
      codeReceptionController.text =
          'trans:${transaction[index].codeReception}';
    }
  }

  void updateData(changetxt) {
    print('update value---> $changetxt');
    setState(() {
      if (changetxt == 'Updade') {
        // Future.delayed(const Duration(seconds: 1000), () {
        retrieveOneTransfert();
        // });
      }
    });
  }

  void funChange(changetxt) {
    setState(() {
      // Navigator.of(context).push(
      //   PageRouteBuilder(
      //     pageBuilder: (BuildContext context, Animation<double> animation,
      //             Animation<double> secondaryAnimation) =>
      //         TransactionScreen(
      //             transaction: transaction,
      //             index: index,
      //             isListTransaction: true,
      //             dataUpdade: dataUpdade),
      //   ),
      // );
      Navigator.pop(context, dataUpdade);
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
                margin: EdgeInsets.only(left: 10.r, top: 60.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top: 5),
                      child: buildIconButtonSvg(
                          iconSvg: 'assets/back.svg',
                          iconColor: const Color(0XFF000000),
                          fontSizeIcon: 35.sp,
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
                  // height: 690.h,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.r, right: 16.r),
                        child: Container(
                            margin: EdgeInsets.only(top: 15.r),
                            child: Text("Les informations de l'expéditeur",
                                style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold))),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25.r, right: 25.r),
                            child: Column(
                              children: [
                                outputField(
                                  topTextLeft: "Nom de l'expéditeur",
                                  bottomTextLeft: transaction[index].user!,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                outputField(
                                  topTextLeft: "Pays d'envoi",
                                  bottomTextLeft:
                                      transaction[index].inZoneCountry!,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                outputField(
                                  topTextLeft: 'N° Téléphone',
                                  bottomTextLeft: '+23765214789471',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.r, right: 16.r),
                            child: Container(
                                margin: EdgeInsets.only(top: 15.r),
                                child: Text("Les informations du destinataire",
                                    style: GoogleFonts.inter(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25.r, right: 25.r),
                            child: Form(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (transaction[index].toBank ==
                                          true) ...[
                                        if (transaction[index].status ==
                                                'OPEN' ||
                                            transaction[index].status ==
                                                'IN APPROVAL' ||
                                            transaction[index].status ==
                                                'CANCELED') ...[
                                          Container(
                                            margin: EdgeInsets.only(top: 10.r),
                                            child: Text("Nom de la banque",
                                                style: TextStyle(
                                                    color: const Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                              controller:
                                                  compteIntituleController,
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
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Container(
                                                      height: 35.h,
                                                      padding: EdgeInsets.only(
                                                          left: 10.r,
                                                          right: 5.r),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color
                                                                    .fromRGBO(
                                                                97, 97, 97, 1)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: DropdownButton(
                                                          hint: Text(
                                                            transaction[index]
                                                                .outZoneCountry!,
                                                            style: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: const Color(
                                                                    0XFF000000)),
                                                          ),
                                                          icon: const Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: Color(
                                                                0XFFF24E1E),
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
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              valueChoose =
                                                                  newValue;
                                                              inputData[
                                                                      "outZoneCity"] =
                                                                  valueChoose;
                                                            });
                                                          },
                                                          items:
                                                              listCountry.map(
                                                            (valueCountry) {
                                                              return DropdownMenuItem(
                                                                  value:
                                                                      valueCountry,
                                                                  child: Text(
                                                                    valueCountry,
                                                                    style: GoogleFonts.inter(
                                                                        fontWeight:
                                                                            FontWeight.bold),
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
                                                    height: 5.h,
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
                                                          transaction[index]
                                                              .outZoneCity!,
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
                                                        value: valueCityChoose,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            valueCityChoose =
                                                                newValue;
                                                            for (int i = 0;
                                                                i <
                                                                    listCountryCode
                                                                        .length;
                                                                i++) {
                                                              print(
                                                                  '+++++ outZoneCity ++++++ ${listCountryCode[i].split('-')[0]}');
                                                              if (valueCityChoose ==
                                                                  listCountryCode[
                                                                          i]
                                                                      .split(
                                                                          '-')[0]) {
                                                                inputData[
                                                                        "outZoneCity"] =
                                                                    listCountryCode[
                                                                        i];
                                                              }
                                                            }
                                                          });
                                                        },
                                                        items: listCities.map(
                                                          (valueCity) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueCity,
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
                                      ] else if (transaction[index].toBank ==
                                          false) ...[
                                        if (transaction[index].status ==
                                                'OPEN' ||
                                            transaction[index].status ==
                                                'IN APPROVAL' ||
                                            transaction[index].status ==
                                                'CANCELED') ...[
                                          Container(
                                            margin: EdgeInsets.only(top: 10.r),
                                            child: Text("Nom du destinataire",
                                                style: TextStyle(
                                                    color: const Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                    fontSize: 17.sp,
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                                          Text("N° Téléphone",
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
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Container(
                                                      height: 35.h,
                                                      padding: EdgeInsets.only(
                                                          left: 10.r,
                                                          right: 5.r),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color
                                                                    .fromRGBO(
                                                                97, 97, 97, 1)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: DropdownButton(
                                                          hint: Text(
                                                            transaction[index]
                                                                .outZoneCountry!,
                                                            style: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: const Color(
                                                                    0XFF000000)),
                                                          ),
                                                          icon: const Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: Color(
                                                                0XFFF24E1E),
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
                                                          onChanged:
                                                              (newValue) {
                                                            setState(() {
                                                              valueCountryChoose =
                                                                  newValue;
                                                              inputData[
                                                                      "outZoneCountry"] =
                                                                  valueCountryChoose;
                                                            });
                                                          },
                                                          items:
                                                              listCountry.map(
                                                            (valueCountry2) {
                                                              return DropdownMenuItem(
                                                                  value:
                                                                      valueCountry2,
                                                                  child: Text(
                                                                    valueCountry2,
                                                                    style: GoogleFonts.inter(
                                                                        fontWeight:
                                                                            FontWeight.bold),
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
                                                    height: 5.h,
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
                                                          transaction[index]
                                                              .outZoneCity!,
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
                                                        value: valueCityChoose,
                                                        onChanged: (newValue) {
                                                          setState(() {
                                                            valueCityChoose =
                                                                newValue;
                                                            for (int i = 0;
                                                                i <
                                                                    listCountryCode
                                                                        .length;
                                                                i++) {
                                                              print(
                                                                  '+++++ outZoneCity ++++++ ${listCountryCode[i].split('-')[0]}');
                                                              if (valueCityChoose ==
                                                                  listCountryCode[
                                                                          i]
                                                                      .split(
                                                                          '-')[0]) {
                                                                inputData[
                                                                        "outZoneCity"] =
                                                                    listCountryCode[
                                                                        i];
                                                              }
                                                            }
                                                          });
                                                        },
                                                        items: listCities.map(
                                                          (valueCity) {
                                                            return DropdownMenuItem(
                                                                value:
                                                                    valueCity,
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
                                        ]
                                      ],
                                      SizedBox(height: 10.h),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //         child: Column(
                                      //       children: [
                                      //         Text("Code de reception",
                                      //             style: TextStyle(
                                      //                 color:
                                      //                     const Color.fromRGBO(
                                      //                         97, 97, 97, 1),
                                      //                 fontSize: 17.sp,
                                      //                 fontWeight:
                                      //                     FontWeight.bold)),
                                      //         SizedBox(
                                      //           height: 10.h,
                                      //         ),
                                      //         SizedBox(
                                      //           height: 35.h,
                                      //           child: TextFormField(
                                      //             controller:
                                      //                 codeReceptionController,
                                      //             style: GoogleFonts.inter(
                                      //                 fontWeight:
                                      //                     FontWeight.bold),
                                      //             decoration: const InputDecoration(
                                      //                 border: OutlineInputBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius.all(
                                      //                             Radius.circular(
                                      //                                 5.0)))),
                                      //             validator: (value) {
                                      //               if (value != null) {
                                      //                 return 'Please enter a user';
                                      //               }
                                      //               return null;
                                      //             },
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     )),
                                      //     Column(
                                      //       crossAxisAlignment:
                                      //           CrossAxisAlignment.start,
                                      //       children: [
                                      //         Text("N° Compte",
                                      //             style: TextStyle(
                                      //                 color:
                                      //                     const Color.fromRGBO(
                                      //                         97, 97, 97, 1),
                                      //                 fontSize: 17.sp,
                                      //                 fontWeight:
                                      //                     FontWeight.bold)),
                                      //         SizedBox(
                                      //           height: 5.h,
                                      //         ),
                                      //         SizedBox(
                                      //           height: 35.h,
                                      //           width: 140.w,
                                      //           child: TextFormField(
                                      //             controller:
                                      //                 numeroCompteController,
                                      //             style: GoogleFonts.inter(
                                      //                 fontWeight:
                                      //                     FontWeight.bold),
                                      //             decoration: const InputDecoration(
                                      //                 border: OutlineInputBorder(
                                      //                     borderRadius:
                                      //                         BorderRadius.all(
                                      //                             Radius.circular(
                                      //                                 5.0)))),
                                      //             validator: (value) {
                                      //               if (value != null) {
                                      //                 return 'Please enter a user';
                                      //               }
                                      //               return null;
                                      //             },
                                      //           ),
                                      //         ),
                                      //       ],
                                      //     )
                                      //   ],
                                      // ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                            children: [
                                              Text("Code de reception",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromRGBO(
                                                              97, 97, 97, 1),
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              SizedBox(
                                                height: 35.h,
                                                child: TextFormField(
                                                  controller:
                                                      codeReceptionController,
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
                                          )),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("N° Compte",
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromRGBO(
                                                              97, 97, 97, 1),
                                                      fontSize: 17.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(
                                                height: 5.h,
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (BuildContext context,
                                              Animation<double> animation,
                                              Animation<double>
                                                  secondaryAnimation) =>
                                          TransactionScreen(
                                              transaction: transaction,
                                              index: index,
                                              isListTransaction: false),
                                    ),
                                  );
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
                            if(isSpinner == true)...[
                            Container(
                              child: CircularProgressIndicator(color: AppColors.orange),
                            ),
                            ],
                            SizedBox(
                              width: 170.w,
                              height: 45.h,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: const Color(0XFFF24E1E),
                                ),
                                onPressed: () {
                                  setState(() {
                                    print(
                                        '-------alertDialog----- id ${codeReceptionController.text}');
                                    inputData["id"] = transaction[index].id;
                                    inputData["receiverName"] =
                                        destinataireNameController.text;
                                    inputData["receiverTel"] =
                                        numeroTelephoneController.text;
                                    if (codeReceptionController.text
                                        .contains('trans:')) {
                                      inputData["codeReception"] =
                                          codeReceptionController.text;
                                    } else {
                                      inputData["codeReception"] =
                                          'trans:${codeReceptionController.text}';
                                    }
                                    inputData["bankNom"] =
                                        banqueNameController.text;
                                    inputData["bankIntitule"] =
                                        compteIntituleController.text;
                                    inputData["numeroCompte"] =
                                        numeroCompteController.text;
                                    print(
                                        '############### inputData--> $inputData');
                                    var tab =
                                        inputData["codeReception"].split(":");
                                    String codeReception = tab[1];
                                    transactions.add(TransactionItem(
                                        id: inputData['id'],
                                        // data[i].status,
                                        // data[i].owner['firstname'] +' ' + data[i].owner['lastname'],
                                        // statusIcon,
                                        // data[i].amount.toString(),
                                        outZoneCountry:
                                            inputData['outZoneCountry'],
                                        outZoneCity: inputData['outZoneCity'],
                                        // data[i].inZone['country']['name'],
                                        // data[i].inZone['name'],
                                        // fdatetime,
                                        codeReception: codeReception,
                                        receiverName: inputData['receiverName'],
                                        receiverTel: inputData['receiverTel'],
                                        bankIntitule: inputData['bankIntitule'],
                                        bankNom: inputData['bankNom'],
                                        // data[i].bank?['number'],
                                        toBank: transaction[index].toBank));
                                    showDialog(
                                        context: context,
                                        builder: (ctx) {
                                          return showdialog(
                                              ctx: ctx,
                                              transactions: transactions[0],
                                              callBackFunction: updateData);
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
      ),
    );
  }
}
