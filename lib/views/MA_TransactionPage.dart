// ignore_for_file: unrelated_type_equality_checks, unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/MA_DataController.dart';
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
    // TransactionItem("Terminé", "William Ndongmo", "check", "450", "USA",
    //     "Lundi 06 mai 2023"),
    // TransactionItem("En Traitement", "Tcheuffa Evariste", "traitement", "750",
    //     "USA", "Lundi 06 mai 2023"),
    // TransactionItem("En Attente", "William Ndongmo", "attente", "1350", "USA",
    //     "Lundi 06 mai 2023"),
    // TransactionItem(
    //     "Terminé", "Ndongmo Thierry", "check", "500", "USA", "Lun08 mai2023"),
    // TransactionItem("Annulé", "William Ndongmo", "cancel", "425", "USA",
    //     "Lundi 06 mai 2023"),
    // TransactionItem("Terminé", "William Ndongmo", "check", "450", "USA",
    //     "Lundi 06 mai 2023"),
    // TransactionItem("En Traitement", "Tcheuffa Evariste", "traitement", "750",
    //     "USA", "Lun08 mai2023"),
    // TransactionItem("En Attente", "William Ndongmo", "attente", "1350", "USA",
    //     "Lundi 06 mai 2023"),
    // TransactionItem(
    //     "Terminé", "Ndongmo Thierry", "check", "600", "USA", "Lun08 mai2023"),
    // TransactionItem("Annulé", "William Ndongmo", "cancel", "850", "USA",
    //     "Lundi 06 mai 2023"),
    // TransactionItem("Terminé", "William Ndongmo", "check", "450", "USA",
    //     "Lundi 06 mai 2023"),
  ];
    List alldata = [];
  Future<void> getDataTransferts() async {
    DataController dataController = DataController();
    alldata = await dataController.retrieveTransferts();
    getAllTransfert(alldata);

    // alltransferts.add(TransactionItemToFireBase(
    //     lastTimeInPending: alldata[0].lastTimeInPending,
    //     amount: alldata[0].amount,
    //     bank: alldata[0].bank,
    //     codeReception: alldata[0].codeReception,
    //     createdDate: alldata[0].createdDate,
    //     deposit: alldata[0].deposit,
    //     description: alldata[0].description,
    //     inZone: alldata[0].inZone,
    //     outZone: alldata[0].outZone,
    //     owner: alldata[0].owner,
    //     ownerId: alldata[0].ownerId,
    //     receiver: alldata[0].receiver,
    //     status: alldata[0].status,
    //     to_bank: alldata[0].to_bank));
    print('transfert---> ${transactions}');
  }

  void getAllTransfert(data) {
    setState(() {
      for (var i = 0; i < data.length; i++) {
        transactions.add(TransactionItem(
          data[i].status,
          data[i].owner['firstname'] + ' ' + data[i].owner['lastname'],
          "traitement",
          data[i].amount.toString(),
          data[i].inZone['name'],
          "Lundi 06 mai 2023",
          alldata[i].codeReception,
          // alldata[i].receiver['nom'],
          // alldata[i].receiver['telephone'],
        ));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDataTransferts();
  }

  bool isListTransaction;
  int currentTransaction;
  TransactionPageState(this.isListTransaction, this.currentTransaction);
  void funChange(changetxt) {
    setState(() {
      print('changetxt --> $changetxt');
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
              return showDialogFilterSort(
                  changetxt: changetxt,
                  ctx: ctx,
                  currentTransaction: currentTransaction);
            });
      } else if (changetxt == 'Trier') {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return showDialogFilterSort(
                  changetxt: changetxt,
                  ctx: ctx,
                  currentTransaction: currentTransaction);
            });
      }
    });
  }

  List<String> tabs = ["Tout", "En cours", "Réussies", "Annulé"];
  // int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (contex, child) => Stack(children: [
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
              margin: EdgeInsets.only(top: 600.r),
              width: 220.w,
              height: 80.h,
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
                        margin: EdgeInsets.only(right: 7.r),
                        child: SvgPicture.asset(
                          'assets/line.svg',
                          width: 25.w,
                          // ignore: deprecated_member_use
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Trier',
                            style: GoogleFonts.inter(fontSize: 15.sp),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5.r, left: 8.r),
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
      ),
      bottomNavigationBar:
          getFooter(callBackFunction: funChange, currentIndex: 1),
    );
  }
}
