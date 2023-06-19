import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/MA_DevisesPage.dart';
import '../views/MA_SettingsPage.dart';
import '../views/MA_TransactionPage.dart';
import '../views/homePage/MA_homePage.dart';
import 'MA_CallableWidget.dart';
import 'MA_TransactionItem.dart';
import 'MA_Widgets.dart';

class TransactionScreen extends StatefulWidget {
  List<TransactionItem> transaction;
  int index;
  static const transactionScreenPage = '/TransactionScreen';
  TransactionScreen(
      {super.key, required this.transaction, required this.index});

  @override
  State<TransactionScreen> createState() =>
      _TransactionScreenState(this.transaction, this.index);
}

class _TransactionScreenState extends State<TransactionScreen>
    with TickerProviderStateMixin {
  List<TransactionItem> transaction;
  int index;
  bool check = true;
  _TransactionScreenState(this.transaction, this.index);
  var txt = 'Nom du bénéficiaire';
  void funChange(changetxt) {
    setState(() {
      txt = changetxt;
      if (changetxt == "Open_pop_up") {
        showDialog(
          context: context,
          builder: (ctx) => Center(
              child: GetDataForm(ctx: ctx, callBackFunction: funInputChange)),
        );
      } else if (changetxt == 'WithoutLabel') {
        Navigator.pushNamed(
            context, TransactionListScreen.transactionListScreen);
      }
    });
  }

  void funChange2(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
      if (changetxt == 0) {
        Navigator.pushNamed(
            context, TransactionListScreen.transactionListScreen);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TransactionListScreen()));
      }
    });
  }

  late bool valueOfBool = false;
  var codeReception = 'null';
  void funInputChange(dataMap) {
    setState(() {
      if (dataMap["boolValue"] == true) {
        valueOfBool = true;
        codeReception = dataMap["password"];
        print('dataMap--> $dataMap');
      }
    });
  }

  List<String> tabs = ["Transaction", "Destinataire", "Expéditeur"];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 240, 238, 238),
      //   elevation: 0,
      //   title: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.only(left: 0),
      //       ),
      //       Text(
      //         txt,
      //         style: TextStyle(color: Colors.black, fontSize: 15),
      //       ),
      //     ],
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildIconButton(
                        iconColor: Color.fromRGBO(17, 16, 15, 1),
                        iconButton: Icons.arrow_back_ios,
                        buttonText: '',
                        fontSizeIcon: 35,
                        callBackFunction: funChange),
                    const Text(
                      'Détail de la transaction',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 75),
                width: double.infinity,
                height: 130,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(242, 78, 30, 1),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$index',
                            style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'James Kora',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 175, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                              child: MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.white,
                            child: buildIconButtonSvg(
                                iconColor: Color.fromRGBO(17, 16, 15, 1),
                                iconSvg: 'assets/cancel.svg',
                                buttonText: 'Annuler',
                                fontSizeIcon: 35,
                                callBackFunction: funChange),
                            padding: EdgeInsets.all(13),
                            shape: CircleBorder(),
                          )),
                          SizedBox(height: 8),
                          const Text('Annuler', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              child: MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.white,
                            child: buildIconButtonSvg(
                                iconColor: Colors.black,
                                buttonText: 'Modifier',
                                iconSvg: 'assets/edit.svg',
                                fontSizeIcon: 36,
                                callBackFunction: funChange),
                            padding: EdgeInsets.all(13),
                            shape: CircleBorder(),
                          )),
                          SizedBox(height: 8),
                          const Text("Modifier",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              child: MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.white,
                            child: buildIconButtonSvg(
                                iconColor: Color.fromRGBO(17, 16, 15, 1),
                                iconSvg: 'assets/confirm.svg',
                                buttonText: 'Confirmer',
                                fontSizeIcon: 35,
                                callBackFunction: funChange),
                            padding: EdgeInsets.all(13),
                            shape: CircleBorder(),
                          )),
                          SizedBox(height: 8),
                          const Text("Confirmer",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /* Bon */
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 280, left: 18, right: 18),
                height: 450,
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
                      offset: Offset(-3, 3), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    /// CUSTOM TABBAR
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 5, right: 5),
                      child: SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: tabs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        current = index;
                                        print('current--> $current');
                                        print('index--> $index');
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: const EdgeInsets.all(5),
                                      width: 111,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: current == index
                                            ? const Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        242, 78, 30, 1),
                                                    width: 3.0,
                                                    style: BorderStyle.solid),
                                              )
                                            : null,
                                      ),
                                      child: Center(
                                        child: Text(
                                          tabs[index],
                                          style: GoogleFonts.laila(
                                              fontSize:
                                                  current == index ? 18 : 16,
                                              fontWeight: FontWeight.w500,
                                              color: current == index
                                                  ? Color.fromRGBO(
                                                      242, 78, 30, 1)
                                                  : Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),

                    /// MAIN BODY
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tabDetails(
                              index:index,
                              transaction: transaction,
                              valueTab: tabs[current],
                              callBackFunction: funChange,
                              valueOfBool: valueOfBool,
                              codeReception: codeReception),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              /* Bon */
            ],
          ),
        ),
      ),

      bottomNavigationBar: getFooter(callBackFunction: funChange2, currentIndex:1),
    );
  }
}
