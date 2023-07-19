import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../MA_TransactionStepper.dart';
import '../../controller/MA_DataController.dart';
import '../../notification/MA_Notification.dart';
import '../../utils/MA_TransactionItem.dart';
import '../../utils/MA_TransactionItemDetails.dart';
import '../../utils/MA_Widgets.dart';
import '../MA_DevisesPage.dart';
import '../MA_SettingsPage.dart';
import '../MA_TransactionPage.dart';
import '../app content/MA_Provider_CheckUser.dart';

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
  List<TransactionItem> transactions = [];

  var txt = '';
  int currentIndex = 0;
  void funChange(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }

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
    print('++++alldata---> ${alldata[1].bank}');
    print('++++intitule---> ${alldata[1].bank?['intitule']}');
  }

  late Map receiverName;
  late String statusIcon;
  void getAllTransfert(data) {
    setState(() {
      for (int? i = 0; i! < data.length; i++) {
        if (data[i].status == 'OPEN') {
          statusIcon = 'traitement';
        } else {}
        receiverName = data[0].inZone;
        print('+++inZone---> ${receiverName['country']['name']}');
        int ts = alldata[i].createdDate['_seconds'];
        DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
        String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
        transactions.add(TransactionItem(
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
          data[i].to_bank
        ));
      }
      // print('receiverName---> $receiverName');
    });
  }

  @override
  void initState() {
    super.initState();
    getDataTransferts();
  }

  @override
  Widget build(BuildContext context) {
    List<TransactionItemToFireBase> alltransactions = [];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.r,
                                right: 20.r,
                                left: 20.r,
                                bottom: 10.r),
                            child: Container(
                              margin: EdgeInsets.only(top: 5.r),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bonjour,",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 75, 67, 67),
                                              fontSize: 16.sp),
                                        ),
                                        Text(
                                          "Lisa Camilla ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 20.r),
                                          child: GestureDetector(
                                            // onTap: () {
                                            //   Navigator.push(context,
                                            //       MaterialPageRoute(builder: (context) => ProfileScreen()));
                                            // },
                                            child: Icon(
                                              Icons.account_circle,
                                              size: 40.h,
                                              color: const Color.fromRGBO(
                                                  242, 78, 30, 1),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(right: 20.0),
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.notifications,
                                                size: 40.h,
                                                color: const Color.fromRGBO(
                                                    242, 78, 30, 1),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 60.r),
                            width: double.infinity,
                            height: 130.h,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(242, 78, 30, 1),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20.r),
                              ),
                            ),
                            padding: EdgeInsets.all(20.r),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(alltransferts[0].owner['firstname']),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 140.r),
                            width: double.infinity,
                            height: 80.h,
                            decoration: const BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            padding: EdgeInsets.only(left: 15.r, right: 15.r),
                            child: Container(
                              margin: EdgeInsets.only(top: 35.r),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mes transactions',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 20.r),
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 8.r),
                                              child: GestureDetector(
                                                onTap: () {
                                                  print('---> tout voir');
                                                  Navigator.of(context).push(
                                                    PageRouteBuilder(
                                                      pageBuilder: (BuildContext
                                                                  context,
                                                              Animation<double>
                                                                  animation,
                                                              Animation<double>
                                                                  secondaryAnimation) =>
                                                          TransactionPage(
                                                              isListTransaction:
                                                                  true,
                                                              currentTransaction:
                                                                  0),
                                                    ),
                                                  );
                                                  // Navigator.pushNamed(context, TransactionPage.transactionpage);
                                                },
                                                child: Text(
                                                  'Tout voir',
                                                  style: GoogleFonts.inter(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 12.sp,
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
                            margin: EdgeInsets.only(top: 210.r),
                            width: double.infinity,
                            height: 530.h,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            padding: EdgeInsets.only(
                                left: 15.r, right: 15.r, top: 15.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (transactions.isEmpty) ...[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 70.r, bottom: 145.r),
                                    child: const Center(
                                      child: Text(
                                          'Aucun transfert pour le moment'),
                                    ),
                                  ),
                                ] else
                                  Expanded(
                                    child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: transactions.length,
                                        itemBuilder: (context, index) {
                                          final transaction =
                                              transactions[index];
                                          if (transactions.isNotEmpty) {
                                            return ListTile(
                                              title: cardItem(
                                                  transaction: transaction),
                                              // Dismissible(
                                              //     key: Key(transaction.user),
                                              //     onDismissed: (direction) {
                                              //       setState(() {
                                              //         transactions.removeAt(index);
                                              //       });
                                              //       ScaffoldMessenger.of(context)
                                              //           .showSnackBar(SnackBar(
                                              //               content: Text(
                                              //                   "${transaction.user} supprimé")));
                                              //     },
                                              //     child: Text(' --card-- ${transaction}'),
                                              //     cardItem(transaction: transaction)
                                              //     ),
                                              onTap: () {
                                                print(
                                                    '----onTap From MA_homePage----');
                                                Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                    pageBuilder: (BuildContext ctxt, Animation<double>
                                                                animation, Animation<double> secondaryAnimation) =>
                                                        TransactionScreen(
                                                            transaction:
                                                                transactions,
                                                            index: index,
                                                            isListTransaction:
                                                                true),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                        }),
                                  ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 110.r,
                            right: 10.r,
                            child: Column(
                              children: [
                                FloatingActionButton.extended(
                                  foregroundColor:
                                      const Color.fromRGBO(255, 255, 255, 1),
                                  backgroundColor:
                                      Color.fromRGBO(11, 47, 125, 1),
                                  icon: SvgPicture.asset(
                                    'assets/transactions.svg',
                                    width: 35.w,
                                    // ignore: deprecated_member_use
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  label: Text('Initier une transaction',
                                      style: TextStyle(fontSize: 18.sp)),
                                  elevation: 10.h,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        pageBuilder: (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation) => const transfertForm(),
                                      ),
                                    );
                                  },
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
        ),
        bottomNavigationBar:
            getFooter(callBackFunction: funChange, currentIndex: 0),
      ),
    );
  }
}
