// ignore_for_file: unrelated_type_equality_checks, unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/MA_CallableWidget.dart';
import '../utils/MA_TransactionItem.dart';
import '../utils/MA_TransactionItemDetails.dart';
import '../utils/MA_Widgets.dart';
import 'MA_DevisesPage.dart';
import 'MA_SettingsPage.dart';
import 'homePage/MA_homePage.dart';

class TransactionPage extends StatefulWidget {
  static const transactionpage = '/TransactionPage';
  bool isListTransaction;
  int currentTransaction;
  TransactionPage(
      {super.key,
      required this.isListTransaction,
      required this.currentTransaction});

  @override
  State<TransactionPage> createState() =>
      TransactionPageState(this.isListTransaction, this.currentTransaction);
}

class TransactionPageState extends State<TransactionPage> {
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
  bool isListTransaction;
  int currentTransaction;
  TransactionPageState(this.isListTransaction, this.currentTransaction);
  void funChange(changetxt) {
    setState(() {
      if (changetxt == 'WithoutLabel' && currentTransaction == 0) {
        Navigator.pushNamed(
            context, TransactionListScreen.transactionListScreen);
      }
      if (changetxt == 'WithoutLabel' && currentTransaction != 0) {
        currentTransaction = 0;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TransactionPage(
                  isListTransaction: isListTransaction,
                  currentTransaction: currentTransaction,
                )));
      } else if (changetxt == 'Filtrer') {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return showDialogFilterSort(changetxt: changetxt, ctx:ctx, currentTransaction: currentTransaction);
            });
      } else if (changetxt == 'Trier') {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return showDialogFilterSort(changetxt: changetxt, ctx: ctx, currentTransaction: currentTransaction);
            });
      }
    });
  }

  List<String> tabs = ["Tout", "En cours", "Réussies", "Annulé"];
  // int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 65),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: buildIconButtonSvg(
                    iconSvg: 'assets/back.svg',
                    iconColor: const Color(0XFF000000),
                    fontSizeIcon: 35,
                    callBackFunction: funChange),
              ),
              const SizedBox(
                width: 25,
              ),
              const Text(
                'Liste des transactions',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),

        /* Start Tab Bar */
        TansactionsTab(
            transactions, tabs[currentTransaction], isListTransaction),
        Container(
          color: const Color(0XFFF0F0F0),
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.all(5),
          width: double.infinity,
          height: 80,
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: tabs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentTransaction = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 13, left: 5, right: 5),
                            width: 95,
                            height: 70,
                            decoration: BoxDecoration(
                              color: currentTransaction == index
                                  ? const Color(0xFFF24E1E)
                                  : const Color(0xFFF0F0F0),
                              borderRadius: currentTransaction == index
                                  ? BorderRadius.circular(25)
                                  : BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                tabs[index],
                                style: GoogleFonts.inter(
                                  color: currentTransaction == index
                                      ? Colors.white
                                      : null,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        /* End Tab Bar */

        /**Start filter */
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 710),
            width: 260,
            height: 90,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: const Color(0XFFF0F0F0),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Filtrer',
                            style: GoogleFonts.inter(fontSize: 15),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5, left: 8),
                            child: buildIconButtonSvg(
                              iconSvg: 'assets/filtre.svg',
                              iconColor: Colors.black,
                              fontSizeIcon: 25,
                              buttonText: 'Filtrer',
                              callBackFunction: funChange,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: SvgPicture.asset(
                        'assets/line.svg',
                        width: 25,
                        // ignore: deprecated_member_use
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Trier',
                          style: GoogleFonts.inter(fontSize: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, left: 8),
                          child: buildIconButtonSvg(
                            iconSvg: 'assets/trier.svg',
                            iconColor: Colors.black,
                            fontSizeIcon: 25,
                            buttonText: 'Trier',
                            callBackFunction: funChange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        /**End filter */
      ]),
      bottomNavigationBar:
          getFooter(callBackFunction: funChange, currentIndex: 1),
    );
  }
}
