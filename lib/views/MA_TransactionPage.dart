// ignore_for_file: unrelated_type_equality_checks, unnecessary_this, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
  final List<TransactionItem> transactions = [];
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

  late String receiverName;
  late String statusTrans;
  late String statusIcon;
  void getAllTransfert(data) {
    setState(() {
      for (int? i = 0; i! < data.length; i++) {
        print('+++++++++++ Id ---> ${data[i].id}');
        print('+++++++++++ amount---> ${data[i].amount}');
        if (data[i].status == 'OPEN') {
          statusIcon = 'traitement';
          var ts = alldata[i].createdDate?['_seconds'];
          // print('+++++++++++ ts---> $ts');
          if (ts != null) {
            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
            String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
            transactions.add(TransactionItem(
                data[i].id,
                data[i].status,
                data[i].owner['firstname'] + ' ' + data[i].owner['lastname'],
                statusIcon,
                data[i].amount.toString(),
                data[i].outZone['country']['name'],
                data[i].outZone['name'],
                data[i].inZone['country']['name'],
                data[i].inZone['name'],
                fdatetime,
                data[i].codeReception,
                data[i].receiver?['nom'],
                data[i].receiver?['telephone'],
                data[i].bank?['intitule'],
                data[i].bank?['nom'],
                data[i].to_bank));
          }
        } else if (data[i].status == 'CANCELED') {
          statusIcon = 'canceled';
          // print('+++inZone---> ${receiverName['country']['name']}');
          var ts = alldata[i].createdDate?['_seconds'];
          print('+++++++++++ ts---> $ts');
          if (ts != null) {
            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
            String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
            transactions.add(TransactionItem(
                data[i].id,
                data[i].status,
                data[i].owner['firstname'] + ' ' + data[i].owner['lastname'],
                statusIcon,
                data[i].amount.toString(),
                data[i].outZone['country']['name'],
                data[i].outZone['name'],
                data[i].inZone['country']['name'],
                data[i].inZone['name'],
                fdatetime,
                data[i].codeReception,
                data[i].receiver?['nom'],
                data[i].receiver?['telephone'],
                data[i].bank?['intitule'],
                data[i].bank?['nom'],
                data[i].to_bank));
          }
        } else if (data[i].status == 'IN APPROVAL') {
          statusIcon = 'attente';
          // print('+++inZone---> ${receiverName['country']['name']}');
          var ts = alldata[i].createdDate?['_seconds'];
          print('+++++++++++ ts---> $ts');
          if (ts != null) {
            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
            String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
            transactions.add(TransactionItem(
                data[i].id,
                data[i].status,
                data[i].owner['firstname'] + ' ' + data[i].owner['lastname'],
                statusIcon,
                data[i].amount.toString(),
                data[i].outZone['country']['name'],
                data[i].outZone['name'],
                data[i].inZone['country']['name'],
                data[i].inZone['name'],
                fdatetime,
                data[i].codeReception,
                data[i].receiver?['nom'],
                data[i].receiver?['telephone'],
                data[i].bank?['intitule'],
                data[i].bank?['nom'],
                data[i].to_bank));
          }
        }
      }
      // print('receiverName---> $receiverName');
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
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                TransactionListScreen(),
          ),
        );
      }
      if (changetxt == 'WithoutLabel' && currentTransaction != 0) {
        currentTransaction = 0;
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                TransactionPage(
              isListTransaction: isListTransaction,
              currentTransaction: currentTransaction,
            ),
          ),
        );
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
    return SafeArea(
      child: Scaffold(
        body: ScreenUtilInit(
          designSize: const Size(360, 690),
          builder: (context, child) => Stack(children: [
            Container(
              margin: EdgeInsets.only(left: 20.r, top: 65.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: buildIconButtonSvg(
                        iconSvg: 'assets/back.svg',
                        iconColor: const Color(0XFF000000),
                        fontSizeIcon: 35.sp,
                        callBackFunction: funChange),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    'Liste des transactions',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            /* Start Tab Bar */
            TansactionsTab(transactions, tabs[currentTransaction], isListTransaction),
            Container(
              color: const Color(0XFFF0F0F0),
              margin: EdgeInsets.only(top: 100.r),
              padding: EdgeInsets.all(5.r),
              width: double.infinity,
              height: 80.r,
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
                margin: EdgeInsets.only(top: 570.r),
                width: 223.w,
                height: 85.h,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  color: const Color(0XFFF0F0F0),
                  elevation: 8.h,
                  child: Padding(
                    padding: EdgeInsets.all(25.r),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                'Filtrer',
                                style: GoogleFonts.inter(fontSize: 15.sp),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10.r, left: 8.r),
                                child: buildIconButtonSvg(
                                  iconSvg: 'assets/filtre.svg',
                                  iconColor: Colors.black,
                                  fontSizeIcon: 20.sp,
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
                              margin: EdgeInsets.only(top: 10.r, left: 8.r),
                              child: buildIconButtonSvg(
                                iconSvg: 'assets/trier.svg',
                                iconColor: Colors.black,
                                fontSizeIcon: 20.sp,
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
      ),
    );
  }
}
