// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
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
  TextEditingController banqueNameController = TextEditingController(text: 'UBA');
  TextEditingController compteNameController = TextEditingController(text: '8475 1523 6589 2547');
  TextEditingController countryNameController = TextEditingController(text: 'Cameroun');
  TextEditingController numeroCompteController = TextEditingController(text: '012478635');
  TextEditingController codeReceptionController = TextEditingController(text: 'trans:062089');
  List listCountry = ['Cameoun', 'USA', 'Angland', 'Italie'];
  var valueChoose;
  int currentIndex = 0;
  void funChange(changetxt) {
    setState(() {
      if (changetxt == 'WithoutLabel') {
        Navigator.pushNamed(
            context, TransactionListScreen.transactionListScreen);}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 65),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   buildIconButtonSvg(
                      iconSvg: 'assets/back.svg',
                      iconColor: const Color(0XFF000000),
                      fontSizeIcon: 40,
                      callBackFunction: funChange,
                    ),
                  const SizedBox(width: 120,),
                  const Text(
                    'Dévise',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30, left: 18, right: 18),
              height: 670,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25), //border corner radius
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
                      margin: const EdgeInsets.only(top: 20),
                      child: Text("Vos dévises en temps réel",
                        style: GoogleFonts.inter(
                        fontSize: 23, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black
                      ),
                    )
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(top: 30, left: 18, right: 18),
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(25), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1), //color of shadow
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
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Text(
                                "USD",
                                style: GoogleFonts.inter(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ],
                      )
                  ),
                  const SizedBox(height: 30,),
                  Container(
                      alignment: Alignment.center,
                      margin:
                          const EdgeInsets.only(top: 30, left: 18, right: 18),
                      height: 250,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(25), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1), //color of shadow
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
                          Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Text(
                                "EUR",
                                style: GoogleFonts.inter(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )),
                        ],
                      )),
                ],
              )
          ),
        ]),
      ),
      /* Tab Bar */
      bottomNavigationBar: getFooter(callBackFunction: funChange, currentIndex: 2),
    );
  }
}
