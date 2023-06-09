import 'package:flutter/material.dart';
import '../../utils/MA_TransactionItem.dart';
import '../../utils/MA_TransactionItemDetails.dart';
import '../../utils/MA_Widgets.dart';

class TransactionListScreen extends StatefulWidget {
  static const transactionListScreen = '/';
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
    TransactionItem("Terminé", "William Ndongmo", "check", "450.00 USD", "Yaoundé",
        "Lun06 mai2023"),
  ];
  Map myMap = {"numero_transaction": "8745126554988", "status": "Terminé"};
  var txt = '';
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
                          children: [
                            Text(txt),
                            // buildIconButton(
                            //     iconColor: Color.fromRGBO(17, 16, 15, 1),
                            //     iconButton: Icons.settings,
                            //     buttonText: '',
                            //     fontSizeIcon: 35,
                            //     callBackFunction: funChange),
                            // Text(
                            //   txt,
                            //   style: TextStyle(
                            //       color: Colors.white70, fontSize: 15),
                            // ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            // Text(
                            //   '540,250.50 USD',
                            //   style:
                            //       TextStyle(color: Colors.white, fontSize: 40),
                            // ),
                          ],
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
                        height: 535,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 240, 238, 238),
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(20),
                          // ),
                        ),
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      TransactionScreen.transactionScreenPage,
                                      arguments: myMap);
                                },
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
      bottomNavigationBar: getFooter(callBackFunction: funChange),
    );
  }
}
