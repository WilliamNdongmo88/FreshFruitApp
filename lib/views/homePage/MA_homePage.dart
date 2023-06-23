// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/MA_DataController.dart';
import '../../utils/MA_TransactionItem.dart';
import '../../utils/MA_TransactionItemDetails.dart';
import '../../utils/MA_Widgets.dart';
import '../MA_TransactionPage.dart';

class TransactionListScreen extends StatefulWidget {
  bool? check;
  static const transactionListScreen = '/';
  static const settingspage = '/SettingsPage';
  static const devisespage = '/DevisesPage';
  static const transactionpage = '/TransactionPage';

  TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => TransactionListScreenState();
}

class TransactionListScreenState extends State<TransactionListScreen> {
  final List<TransactionItem> transactions = [
    TransactionItem("Terminé", "William Ndongmo", "check", "450", "USA",
        "Lundi 06 mai 2023"),
    TransactionItem("En Traitement", "Tcheuffa Evariste", "traitement", "750",
        "USA", "Lundi 06 mai 2023"),
    TransactionItem("En Attente", "William Ndongmo", "attente", "1350", "USA",
        "Lundi 06 mai 2023"),
    TransactionItem(
        "Terminé", "Ndongmo Thierry", "check", "500", "USA", "Lun08 mai2023"),
    TransactionItem("Annulé", "William Ndongmo", "cancel", "425", "USA",
        "Lundi 06 mai 2023"),
    TransactionItem("Terminé", "William Ndongmo", "check", "450", "USA",
        "Lundi 06 mai 2023"),
    TransactionItem("En Traitement", "Tcheuffa Evariste", "traitement", "750",
        "USA", "Lun08 mai2023"),
    TransactionItem("En Attente", "William Ndongmo", "attente", "1350", "USA",
        "Lundi 06 mai 2023"),
    TransactionItem(
        "Terminé", "Ndongmo Thierry", "check", "600", "USA", "Lun08 mai2023"),
    TransactionItem("Annulé", "William Ndongmo", "cancel", "850", "USA",
        "Lundi 06 mai 2023"),
    TransactionItem("Terminé", "William Ndongmo", "check", "450", "USA",
        "Lundi 06 mai 2023"),
  ];

  var txt = '';
  int currentIndex = 0;
  void funChange(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }

  List<TransactionItemToFireBase> alltransferts = [];
  Future<void> getDataTransferts() async {
    DataController dataController = DataController();
    alltransferts = await dataController.retrieveTransferts();
    print('transfert---> $alltransferts');
  }

  @override
  void initState() {
    super.initState();
    getDataTransferts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 240, 238, 238),
      //   elevation: 0,
      //   title: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: const [
      //       Padding(
      //         padding: EdgeInsets.only(left: 0),
      //       ),
      //       Text(
      //         "Bonjour,",
      //         style: TextStyle(
      //             color: Color.fromARGB(255, 75, 67, 67), fontSize: 12),
      //       ),
      //       Text(
      //         "Lisa Camilla",
      //         style: TextStyle(color: Colors.black, fontSize: 15),
      //       ),
      //     ],
      //   ),
      //   actions: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.only(right: 20.0),
      //       child: GestureDetector(
      //         // onTap: () {
      //         //   Navigator.push(context,
      //         //       MaterialPageRoute(builder: (context) => ProfileScreen()));
      //         // },
      //         child: Icon(
      //           Icons.account_circle,
      //           size: 26.0,
      //           color: Color.fromRGBO(242, 78, 30, 1),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //         padding: EdgeInsets.only(right: 20.0),
      //         child: GestureDetector(
      //           onTap: () {},
      //           child: Icon(
      //             Icons.notifications,
      //             size: 26.0,
      //             color: Color.fromRGBO(242, 78, 30, 1),
      //           ),
      //       )
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, left: 20, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Bonjour,",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 75, 67, 67),
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "Lisa Camilla",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.0),
                                    child: GestureDetector(
                                      // onTap: () {
                                      //   Navigator.push(context,
                                      //       MaterialPageRoute(builder: (context) => ProfileScreen()));
                                      // },
                                      child: const Icon(
                                        Icons.account_circle,
                                        size: 40,
                                        color: Color.fromRGBO(242, 78, 30, 1),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 20.0),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.notifications,
                                          size: 40,
                                          color: Color.fromRGBO(242, 78, 30, 1),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60),
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
                            Text(txt),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 140),
                        width: double.infinity,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          margin: const EdgeInsets.only(top: 35),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Mes transactions',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0),
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          child: GestureDetector(
                                            onTap: () {
                                              print('---> tout voir');
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TransactionPage(
                                                              isListTransaction:
                                                                  true,
                                                              currentTransaction:
                                                                  0)));
                                              // Navigator.pushNamed(context, TransactionPage.transactionpage);
                                            },
                                            child: Text(
                                              'Tout voir',
                                              style: GoogleFonts.inter(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12,
                                                fontStyle: FontStyle.normal,
                                                color: const Color.fromARGB(
                                                    255, 40, 38, 38),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 210),
                        width: double.infinity,
                        height: 545,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: transactions.length,
                                  itemBuilder: (context, index) {
                                    final transaction = transactions[index];
                                    return ListTile(
                                      title: Dismissible(
                                          key: Key(transaction.user),
                                          onDismissed: (direction) {
                                            setState(() {
                                              transactions.removeAt(index);
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "${transaction.user} supprimé")));
                                          },
                                          child: cardItem(
                                              transaction: transaction)),
                                      onTap: () {
                                        print('----onTap From MA_homePage----');
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TransactionScreen(
                                                        transaction:
                                                            transactions,
                                                        index: index,
                                                        isListTransaction:
                                                            true)));
                                      },
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 120,
                        right: 10,
                        child: Column(
                          children: [
                            FloatingActionButton.extended(
                              foregroundColor:
                                  const Color.fromRGBO(255, 255, 255, 1),
                              backgroundColor: Color.fromRGBO(11, 47, 125, 1),
                              icon: SvgPicture.asset(
                                'assets/transactions.svg',
                                width: 35,
                                // ignore: deprecated_member_use
                                color: const Color.fromRGBO(255, 255, 255, 1),
                              ),
                              label: const Text('Initier une transaction',
                                  style: TextStyle(fontSize: 18)),
                              elevation: 10,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          getFooter(callBackFunction: funChange, currentIndex: 0),
    );
  }
}
