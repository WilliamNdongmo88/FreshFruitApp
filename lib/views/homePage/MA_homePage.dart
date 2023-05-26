import 'package:flutter/material.dart';
// import 'package:moneyapp/profileScreen.dart';
import 'package:money_app/utils/MA_TransactionItem.dart';

import '../../utils/MA_Widgets.dart';
// import 'package:moneyapp/transactionScreen.dart';

// import 'MA_CustomIconButton.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => TransactionListScreenState();
}

class TransactionListScreenState extends State<TransactionListScreen> {
  final List<TransactionItem> transactions = [
    TransactionItem("Terminé", "William Ndongmo", "check", "450.00 USD", "Yaoundé",
        "Lun06 mai2023"),
    TransactionItem("En cours", "Tcheuffa Evariste", "Autorenew", "750.00 USD",
        "Yaoundé", "Lun08 mai2023"),
    TransactionItem("Terminé", "William Ndongmo", "Cancel", "1350.00 USD",
        "Yaoundé", "Lun06 mai2023"),
    TransactionItem("Terminé", "Ndongmo Thierry", "check", "500.00 USD", "Yaoundé",
        "Lun08 mai2023"),
    TransactionItem("Terminé", "William Ndongmo", "check", "450.00 USD", "Yaoundé",
        "Lun06 mai2023"),
    TransactionItem("En cours", "Tcheuffa Evariste", "Autorenew", "750.00 USD",
        "Yaoundé", "Lun08 mai2023"),
    TransactionItem("Terminé", "William Ndongmo", "Cancel", "1350.00 USD",
        "Yaoundé", "Lun06 mai2023"),
    TransactionItem("Terminé", "Ndongmo Thierry", "check", "600.00 USD", "Yaoundé",
        "Lun08 mai2023"),
    TransactionItem("Terminé", "Ndongmo Thierry", "check", "500.00 USD", "Yaoundé",
        "Lun08 mai2023"),
    TransactionItem("Terminé", "William Ndongmo", "check", "450.00 USD", "Yaoundé",
        "Lun06 mai2023"),
  ];

  int _currentIndex = 0;

  final tabs = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Camera')),
    Center(child: Text('Profile')),
  ];

  var txt = 'Sample text';
  void funChange(changetxt) {
    setState(() {
      txt = changetxt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 238, 238),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 0),
            ),
            Text(
              "Bonjour,",
              style: TextStyle(
                  color: Color.fromARGB(255, 75, 67, 67), fontSize: 12),
            ),
            Text(
              "Lisa Camilla",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => ProfileScreen()));
              // },
              child: Icon(
                Icons.account_circle,
                size: 26.0,
                color: Color.fromRGBO(242, 78, 30, 1),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications,
                  size: 26.0,
                  color: Color.fromRGBO(242, 78, 30, 1),
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
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
                          // children: [
                          //   tabs[_currentIndex],
                          //   buildIconButton(
                          //       iconColor: Color.fromRGBO(17, 16, 15, 1),
                          //       iconButton: Icons.settings,
                          //       buttonText: '',
                          //       fontSizeIcon: 55,
                          //       callBackFunction: funChange),
                          //   // Text(
                          //   //   txt,
                          //   //   style: TextStyle(
                          //   //       color: Colors.white70, fontSize: 15),
                          //   // ),
                          //   // SizedBox(
                          //   //   height: 5,
                          //   // ),
                          //   // Text(
                          //   //   '540,250.50 USD',
                          //   //   style:
                          //   //       TextStyle(color: Colors.white, fontSize: 40),
                          //   // ),
                          // ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        width: double.infinity,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 238, 238),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(32),
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
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Tout voir',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 170),
                        width: double.infinity,
                        height: 600,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 238, 238),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                // onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(builder: (context) =>TransactionScreen()));
                                // },
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: transactions.length,
                                    itemBuilder: (context, index) {
                                      final transaction = transactions[index];
                                      return Dismissible(
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
                                              transaction: transaction));
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 10,
                        child: Column(
                          children: [
                            FloatingActionButton.extended(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromRGBO(25, 47, 93, 1),
                              icon: const Icon(Icons.sync_outlined),
                              label: const Text('Initier une transaction'),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 15,
        // unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.transfer_within_a_station),
            label: 'Translation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Devises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Sttings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class TransactionItemWidget extends StatelessWidget {
  final TransactionItem transaction;
  const TransactionItemWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.orange,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      // padding: const EdgeInsets.only(left: 30, right: 30),
      // width: 450,
      // height: 115,
      child: GestureDetector(
          // onTap: () {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => TransactionScreen()));
          // },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
            ),
            margin: EdgeInsets.all(8),
            elevation: 8,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(transaction.date,
                                    style: TextStyle(color: Colors.grey[500])),
                                Text(transaction.user),
                              ],
                            ),
                          ),
                          Text(transaction.amont,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(children: [
                      Text(transaction.status,
                          style: TextStyle(color: Colors.grey[500])),
                      Container(
                          padding: const EdgeInsets.only(top: 0),
                          child: LayoutBuilder(builder: (context, constraints) {
                            if (transaction.icon == "check") {
                              return Icon(Icons.check_circle,
                                  color: Colors.green);
                            } else if (transaction.icon == "Autorenew") {
                              return Icon(Icons.autorenew,
                                  color: Colors.yellow);
                            } else {
                              return Icon(Icons.cancel, color: Colors.red);
                            }
                          })
                          //
                          ),
                    ]),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
