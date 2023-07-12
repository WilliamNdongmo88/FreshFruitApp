import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
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
          // alldata[i].receiver['name'],
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

  @override
  Widget build(BuildContext context) {
    List<TransactionItemToFireBase> alltransactions = [];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: () => SingleChildScrollView(
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
                                          color:
                                              Color.fromARGB(255, 75, 67, 67),
                                          fontSize: 16),
                                    ),
                                    Text(
                                      "Lisa Camilla ",
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
                                            color:
                                                Color.fromRGBO(242, 78, 30, 1),
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
                              // Text(alltransferts[0].owner['firstname']),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            margin:
                                                const EdgeInsets.only(top: 8),
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
                          height: 690.h,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (transactions.isEmpty) ...[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 95.r, bottom: 145.r),
                                  child: const Center(
                                    child:
                                        Text('Aucun transfert pour le moment'),
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
                                        if (transactions.length > 0) {
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
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              transfertForm()));
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
    );
  }
}
