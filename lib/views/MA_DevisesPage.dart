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
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 55),
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
                const Text(
                  'Modification de la transaction',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30, left: 18, right: 18),
              // height: 690,
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
                      child: Text("Les informations de l'expéditeur",
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.bold))),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Column(
                        children: [
                          outputField(
                            topTextLeft: "Nom de l'expéditeur",
                            bottomTextLeft: 'James Kora',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          outputField(
                            topTextLeft: "Pays d'envoi",
                            bottomTextLeft: 'USA',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          outputField(
                            topTextLeft: 'N° Téléphone',
                            bottomTextLeft: '+23765214789471',
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 18, right: 14),
                            child: Text("Les informations sur le destinataire",
                                style: GoogleFonts.inter(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          Form(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: const Text("Nom de la banque",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(97, 97, 97, 1),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: banqueNameController,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold),
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)))),
                                        validator: (value) {
                                          if (value != null) {
                                            return 'Please enter a user';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text("Intitulé du compte",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(97, 97, 97, 1),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: compteNameController,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold),
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)))),
                                        validator: (value) {
                                          if (value != null) {
                                            return 'Please enter a user';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Pays",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          97, 97, 97, 1),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 35,
                                                padding: const EdgeInsets.only(left: 10, right: 5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: const Color.fromRGBO(97, 97, 97, 1)),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: DropdownButton(
                                                  hint: Text("Cameroun", style: GoogleFonts.inter(fontWeight: FontWeight.bold,color: const Color(0XFF000000)),),
                                                  icon: const Icon(Icons.arrow_drop_down, color: Color(0XFFF24E1E),),
                                                  iconSize: 40,
                                                  underline: const SizedBox(),
                                                  style: GoogleFonts.inter(
                                                    color: const Color(0XFF000000),
                                                  ),
                                                  value: valueChoose,
                                                  onChanged: (newValue) {
                                                    setState(() {
                                                        valueChoose = newValue;
                                                      });
                                                  }, 
                                                  items: listCountry.map((valueCountry){
                                                    return DropdownMenuItem(
                                                      value: valueCountry,
                                                      child: Text(valueCountry, style: GoogleFonts.inter(fontWeight: FontWeight.bold),));
                                                  },).toList()
                                                ),
                                              )
                                              // SizedBox(
                                              //   height: 35,
                                              //   width: 140,
                                              //   child: TextFormField(
                                              //     controller: userController,
                                              //     decoration: const InputDecoration(
                                              //         border: OutlineInputBorder(
                                              //             borderRadius:
                                              //                 BorderRadius.all(
                                              //                     Radius.circular(
                                              //                         5.0)))),
                                              //     validator: (value) {
                                              //       if (value != null) {
                                              //         return 'Please enter a user';
                                              //       }
                                              //       return null;
                                              //     },
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text("N° Compte",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        97, 97, 97, 1),
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 35,
                                              width: 140,
                                              child: TextFormField(
                                                controller: numeroCompteController,
                                                style: GoogleFonts.inter(fontWeight:FontWeight.bold),
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
                                    const SizedBox(height: 10),
                                    const Text("Code de reception",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(97, 97, 97, 1),
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: codeReceptionController,
                                        style: GoogleFonts.inter(
                                            fontWeight: FontWeight.bold),
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)))),
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
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 180,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0XFFF24E1E),
                            ),
                            onPressed: () {
                              // Navigator.of(ctx).pop();
                            },
                            child: Text(
                              'Annuler',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: const Color(0xfffffffff),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0XFFF24E1E),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Confirmer',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
      /* Tab Bar */
      bottomNavigationBar: getFooter(callBackFunction: funChange, currentIndex: 2),
    );
  }
}
