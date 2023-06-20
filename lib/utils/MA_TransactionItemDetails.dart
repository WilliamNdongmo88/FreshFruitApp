// ignore_for_file: sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../views/MA_EditeData.dart';
import '../views/homePage/MA_homePage.dart';
import 'MA_CallableWidget.dart';
import 'MA_TransactionItem.dart';
import 'MA_Widgets.dart';

// ignore: must_be_immutable
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
      } else if (changetxt == 'Modifier') {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                EditeData(transaction: transaction, index: index)));
      } else if (changetxt == 'Annuler' || changetxt == 'Supprimer' || changetxt == 'Relancer') {
        showDialog(
          context: context,
          builder: (ctx) => showdialog(ctx: ctx, changetxt: changetxt),
        );
      }
    });
  }

  void funChange2(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
      if (changetxt == 0) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TransactionListScreen()));
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
    bool isSizeBox = false;
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
                            '$txt ' '$index',
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
              if (transaction[index].status == 'En Attente') ...[
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
                                  iconColor:
                                      const Color.fromRGBO(17, 16, 15, 1),
                                  iconSvg: 'assets/cancel2.svg',
                                  buttonText: 'Annuler',
                                  fontSizeIcon: 35,
                                  callBackFunction: funChange),
                              padding: const EdgeInsets.all(13),
                              shape: const CircleBorder(),
                            )),
                            const SizedBox(height: 8),
                            const Text('Annuler',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          MaterialButton(
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
                          ),
                          const SizedBox(height: 8),
                          const Text("Modifier",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.white,
                            child: buildIconButtonSvg(
                                iconColor: Color.fromRGBO(17, 16, 15, 1),
                                iconSvg: 'assets/confirm.svg',
                                buttonText: 'Confirmer',
                                fontSizeIcon: 35,
                                callBackFunction: funChange),
                            padding: const EdgeInsets.all(13),
                            shape: const CircleBorder(),
                          ),
                          const SizedBox(height: 8),
                          const Text("Confirmer",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ] else if (transaction[index].status == 'En Traitement') ...[
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
                                  iconColor:
                                      const Color.fromRGBO(17, 16, 15, 1),
                                  iconSvg: 'assets/cancel2.svg',
                                  buttonText: 'Annuler',
                                  fontSizeIcon: 35,
                                  callBackFunction: funChange),
                              padding: const EdgeInsets.all(13),
                              shape: const CircleBorder(),
                            )),
                            const SizedBox(height: 8),
                            const Text('Annuler',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 80),
                      Column(
                        children: [
                          MaterialButton(
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
                          ),
                          const SizedBox(height: 8),
                          const Text("Modifier",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ] else if (transaction[index].status == 'Annulé') ...[
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
                                  iconColor:
                                      const Color.fromRGBO(17, 16, 15, 1),
                                  iconSvg: 'assets/delete.svg',
                                  buttonText: 'Supprimer',
                                  fontSizeIcon: 35,
                                  callBackFunction: funChange),
                              padding: const EdgeInsets.all(13),
                              shape: const CircleBorder(),
                            )),
                            const SizedBox(height: 8),
                            const Text('Supprimer',
                                style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          MaterialButton(
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
                          ),
                          const SizedBox(height: 8),
                          const Text("Modifier",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.white,
                            textColor: Colors.white,
                            child: buildIconButtonSvg(
                                iconColor: Color.fromRGBO(17, 16, 15, 1),
                                iconSvg: 'assets/relancer.svg',
                                buttonText: 'Relancer',
                                fontSizeIcon: 35,
                                callBackFunction: funChange),
                            padding: const EdgeInsets.all(13),
                            shape: const CircleBorder(),
                          ),
                          const SizedBox(height: 8),
                          const Text("Relancer",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              /* Tab Bar */
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: transaction[index].status == 'Terminé' ? 230 : 280,
                    left: 18,
                    right: 18),
                height: transaction[index].status == 'Terminé' ? 510 : 450,
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
                                          style: GoogleFonts.inter(
                                              fontSize:
                                                  current == index ? 18 : 16,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.normal,
                                              color: current == index
                                                  ? const Color.fromRGBO(
                                                      242, 78, 30, 1)
                                                  : Color(0XFF6F6F6F)),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          tabDetails(
                              index: index,
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
              /* Tab Bar */
            ],
          ),
        ),
      ),

      bottomNavigationBar:
          getFooter(callBackFunction: funChange2, currentIndex: 1),
    );
  }
}
