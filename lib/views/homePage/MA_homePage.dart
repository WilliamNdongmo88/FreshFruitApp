import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../MA_TransactionStepper.dart';
import '../../controller/MA_DataController.dart';
import '../../utils/MA_TransactionItem.dart';
import '../../utils/MA_TransactionItemDetails.dart';
import '../../utils/MA_Widgets.dart';
import '../MA_TransactionPage.dart';

// ignore: must_be_immutable
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

  late String userName;
  List alldata = [];
  Future<void> getDataTransferts() async {
    DataController dataController = DataController();
    alldata = await dataController.retrieveTransferts();
    getAllTransfert(alldata);
    // userName = alldata[1].owner['firstname'] + alldata[1].owner['lastname'];
    // print('++++alldata---> ${alldata[1].id}');
    // print('++++alldatabank---> ${alldata[1].bank}');
    // print('++++intitulebankintitule---> ${alldata[1].bank?['intitule']}');
  }

  late Map receiverName;
  late String statusIcon;
  void getAllTransfert(data) {
    setState(() {
      for (int? i = 0; i! < data.length; i++) {
        // print('+++++++++++ Id ---> ${data[i].id}');
        // print('+++++++++++ amount---> ${data[i].amount}');
        if (data[i].status == 'OPEN') {
          statusIcon = 'traitement';
          var ts = alldata[i].createdDate?['_seconds'];
          // print('+++++++++++ ts---> $ts');
          if (ts != null) {
            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
            String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
            transactions.add(TransactionItem(
                id: data[i].id,
                status: data[i].status,
                user: data[i].owner['firstname'] +
                    ' ' +
                    data[i].owner['lastname'],
                icon: statusIcon,
                amont: data[i].amount.toString(),
                outZoneCountry: data[i].outZone['country']['name'],
                outZoneCity: data[i].outZone['name'],
                inZoneCountry: data[i].inZone['country']['name'],
                inZoneCity: data[i].inZone['name'],
                date: fdatetime,
                codeReception: data[i].codeReception,
                receiverName: data[i].receiver?['nom'],
                receiverTel: data[i].receiver?['telephone'],
                bankIntitule: data[i].bank?['intitule'],
                bankNom: data[i].bank?['nom'],
                // data[i].bank?['number'],
                toBank: data[i].to_bank));
            userName = transactions[i].user!;
          }
        } else if (data[i].status == 'CANCELED') {
          statusIcon = 'canceled';
          // print('+++inZone---> ${receiverName['country']['name']}');
          var ts = alldata[i].createdDate?['_seconds'];
          // print('+++++++++++ ts---> $ts');
          if (ts != null) {
            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
            String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
            transactions.add(TransactionItem(
                id: data[i].id,
                status: data[i].status,
                user: data[i].owner['firstname'] +
                    ' ' +
                    data[i].owner['lastname'],
                icon: statusIcon,
                amont: data[i].amount.toString(),
                outZoneCountry: data[i].outZone['country']['name'],
                outZoneCity: data[i].outZone['name'],
                inZoneCountry: data[i].inZone['country']['name'],
                inZoneCity: data[i].inZone['name'],
                date: fdatetime,
                codeReception: data[i].codeReception,
                receiverName: data[i].receiver?['nom'],
                receiverTel: data[i].receiver?['telephone'],
                bankIntitule: data[i].bank?['intitule'],
                bankNom: data[i].bank?['nom'],
                // data[i].bank?['number'],
                toBank: data[i].to_bank));
            userName = transactions[i].user!;
          }
        }else if (data[i].status == 'IN APPROVAL') {
          statusIcon = 'attente';
          // print('+++inZone---> ${receiverName['country']['name']}');
          var ts = alldata[i].createdDate?['_seconds'];
          // print('+++++++++++ ts---> $ts');
          if (ts != null) {
            DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(ts * 1000);
            String fdatetime = DateFormat('dd-MMM-yyy').format(tsdate);
            transactions.add(TransactionItem(
                id: data[i].id,
                status: data[i].status,
                user: data[i].owner['firstname'] +
                    ' ' +
                    data[i].owner['lastname'],
                icon: statusIcon,
                amont: data[i].amount.toString(),
                outZoneCountry: data[i].outZone['country']['name'],
                outZoneCity: data[i].outZone['name'],
                inZoneCountry: data[i].inZone['country']['name'],
                inZoneCity: data[i].inZone['name'],
                date: fdatetime,
                codeReception: data[i].codeReception,
                receiverName: data[i].receiver?['nom'],
                receiverTel: data[i].receiver?['telephone'],
                bankIntitule: data[i].bank?['intitule'],
                bankNom: data[i].bank?['nom'],
                // data[i].bank?['number'],
                toBank: data[i].to_bank));
            userName = transactions[i].user!;
          }
        }
      }
      receiverName = data[0].inZone;
      // print('0000000userName---> $userName');
    });
  }

  // Future<void> updatesTransfert() async {
  //   DataController dataController = DataController();
  //   await dataController.updateTransfert(transactions);
  // }
  @override
  void initState() {
    userName = "";
    super.initState();
    getDataTransferts();
  }

  @override
  Widget build(BuildContext context) {
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
                                          userName,
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
                            child: Column(
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
                                          final transaction = transactions[index];
                                          if (transactions.isNotEmpty) {
                                            return ListTile(
                                              title: 
                                              cardItem(transaction: transaction),
                                              // Text('data'),
                                              // Dismissible(
                                              //     key: Key(transaction.user as String),
                                              //     onDismissed: (direction) {
                                              //       setState(() {
                                              //         transactions.removeAt(index);
                                              //       });
                                              //       ScaffoldMessenger.of(context)
                                              //           .showSnackBar(SnackBar(
                                              //               content: Text(
                                              //                   "${transaction.user} supprimé")));
                                              //     },
                                              //     child: 
                                              //     // Text(' --card-- ${transaction}'),
                                              //     cardItem(transaction: transaction)
                                              //     ),
                                              onTap: () {
                                                print(
                                                    '----onTap From MA_homePage----');
                                                Navigator.of(context).push(
                                                  PageRouteBuilder(
                                                    pageBuilder: (BuildContext
                                                                ctxt,
                                                            Animation<double>
                                                                animation,
                                                            Animation<double>
                                                                secondaryAnimation) =>
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
                                                    secondaryAnimation) =>
                                            const transfertForm(),
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
