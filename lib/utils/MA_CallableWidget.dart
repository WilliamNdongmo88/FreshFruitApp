// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state, unnecessary_this, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MA_TransactionItem.dart';
import 'MA_TransactionItemDetails.dart';
import 'MA_Widgets.dart';
import 'package:intl/intl.dart';

//Will Code Start

Widget tabDetails(
    {String? valueTab,
    Function? callBackFunction,
    List<TransactionItem>? transaction,
    int? index,
    bool? valueOfBool,
    String? codeReception}) {
  if (valueTab == 'Transaction') {
    return tabTransaction(transaction, index);
  } else if (valueTab == 'Destinataire') {
    print('-->codeReception $codeReception');
    return tabDestinataire(
        transaction, index, callBackFunction, valueOfBool!, codeReception!);
  } else {
    return tabExpediteur(
        transaction, index, callBackFunction, valueOfBool!, codeReception!);
  }
}

Widget tabTransaction(transaction, index) {
  int frais = 20;
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Column(
      children: [
        outputField(
          topTextLeft: 'N° Transaction',
          bottomTextLeft: '65214789471',
        ),
        const SizedBox(
          height: 15,
        ),
        outputField(
          topTextLeft: 'Date',
          bottomTextLeft: '26/06/2023',
        ),
        const SizedBox(
          height: 15,
        ),
        if (transaction[index].status == 'Terminé') ...[
          outputField(
              topTextLeft: 'Status',
              bottomTextLeft: transaction[index].status,
              svgLink: 'assets/termine.svg',
              color: Color(0xFF2ADFB6)),
        ] else if (transaction[index].status == 'En Traitement') ...[
          outputField(
              topTextLeft: 'Status',
              bottomTextLeft: 'En cours de Traitement',
              svgLink: 'assets/spinner.svg',
              color: Color(0xFFFFC700)),
        ] else if (transaction[index].status == 'En Attente') ...[
          outputField(
              topTextLeft: 'Status',
              bottomTextLeft: transaction[index].status,
              svgLink: 'assets/spinner.svg',
              color: Color(0xFFF24E1E)),
        ] else
          outputField(
              topTextLeft: 'Status',
              bottomTextLeft: transaction[index].status,
              svgLink: 'assets/cancel.svg',
              color: const Color(0xFFFFF0000)),
        const SizedBox(
          height: 10,
        ),
        outputField(
            topTextLeft: 'Montant',
            bottomTextLeft: transaction[index].amont,
            topTextRight: 'Frais',
            bottomTextRight_Int: frais),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.only(
                top: transaction[index].status == 'Terminé' ? 35 : 15),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // margin: const EdgeInsets.only(left: 25),
                      child: const Text(
                        "Montant total:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    '\$${int.parse(transaction[index].amont) + frais}.00',
                    style: const TextStyle(
                        color: Color.fromRGBO(246, 60, 3, 1),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget tabDestinataire(transaction, index, Function? callBackFunction,
    bool valueOfBool, String codeReception) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
    child: Container(
      child: Column(
        children: [
          if (transaction[index].status == 'En Traitement') ...[
            outputField(topTextLeft: 'Nom de la banque', bottomTextLeft: 'UBA'),
            const SizedBox(
              height: 15,
            ),
            outputField(
              topTextLeft: 'Intitulé du compte',
              bottomTextLeft: '9874 5247 6582 1458',
            ),
            const SizedBox(
              height: 15,
            ),
            outputField(topTextLeft: 'N° Compte', bottomTextLeft: '012458479'),
            const SizedBox(
              height: 15,
            ),
            outputField(topTextLeft: 'Pays', bottomTextLeft: 'Cameroun'),
            const SizedBox(
              height: 15,
            ),
            if (valueOfBool == false && codeReception == 'null') ...[
              Container(
                margin: const EdgeInsets.only(top: 25),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
                  ),
                ),
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Container(
                    margin: const EdgeInsets.only(left: 55),
                    child: GestureDetector(
                      onTap: () {
                        callBackFunction!('Open_pop_up');
                      },
                      child: const Text(
                        "voir code de reception",
                        style: TextStyle(
                            color: Color.fromRGBO(79, 79, 78, 1), fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ] else
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Code de reception",
                        style: TextStyle(
                            color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'trans: $codeReception',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ] else if (transaction[index].status == 'En Attente' ||
              transaction[index].status == 'Terminé' ||
              transaction[index].status == 'Annulé') ...[
            outputField(
                topTextLeft: 'Nom du destinataire',
                bottomTextLeft: 'Robert Boum'),
            const SizedBox(
              height: 15,
            ),
            outputField(
                topTextLeft: 'Pays',
                bottomTextLeft: 'Cameroon',
                topTextRight: 'Vile',
                bottomTextRight_String: 'Yaoundé'),
            const SizedBox(
              height: 15,
            ),
            outputField(
                topTextLeft: 'N° Téléphone', bottomTextLeft: '+237655002318'),
            const SizedBox(
              height: 25,
            ),
            if (valueOfBool == false && codeReception == 'null') ...[
              Container(
                margin: const EdgeInsets.only(top: 35),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
                  ),
                ),
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        callBackFunction!('Open_pop_up');
                      },
                      child: const Center(
                        child: Text(
                          "voir code de reception",
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 78, 1),
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ] else
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Code de reception",
                        style: TextStyle(
                            color: Color.fromRGBO(79, 79, 79, 1), fontSize: 14),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'trans: $codeReception',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ]
        ],
      ),
    ),
  );
}

Widget tabExpediteur(transaction, index, Function? callBackFunction,
    bool valueOfBool, String codeReception) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Column(
      children: [
        if (transaction[index].status == 'Terminé' ||
            transaction[index].status == 'En Traitement') ...[
          const SizedBox(
            height: 20,
          ),
          outputField(
              topTextLeft: 'Nom de léexpéditeur',
              bottomTextLeft: 'Robert Boum'),
          const SizedBox(
            height: 35,
          ),
          outputField(
              topTextLeft: 'Pays',
              bottomTextLeft: 'USA',
              topTextRight: 'Vile',
              bottomTextRight_String: 'New York'),
          const SizedBox(
            height: 35,
          ),
          outputField(
              topTextLeft: 'N° Téléphone', bottomTextLeft: '+237655002318'),
          const SizedBox(
            height: 35,
          ),
          if (valueOfBool == false && codeReception == 'null') ...[
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
                ),
              ),
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: () {
                    callBackFunction!('Open_pop_up');
                  },
                  child: const Center(
                    child: Text(
                      "voir photo CNI",
                      style: TextStyle(
                          color: Color.fromRGBO(79, 79, 78, 1), fontSize: 13),
                    ),
                  ),
                ),
              ),
            ),
          ] else
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Code de reception",
                      style: TextStyle(
                          color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'trans: $codeReception',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
        ] else if (transaction[index].status == 'En Traitement' ||
            transaction[index].status == 'En Attente' ||
            transaction[index].status == 'Annulé') ...[
          outputField(
              topTextLeft: 'Nom de léexpéditeur',
              bottomTextLeft: 'Robert Boum'),
          const SizedBox(
            height: 5,
          ),
          outputField(
              topTextLeft: 'Pays',
              bottomTextLeft: 'USA',
              topTextRight: 'Vile',
              bottomTextRight_String: 'New York'),
          const SizedBox(
            height: 5,
          ),
          outputField(
              topTextLeft: 'N° Téléphone', bottomTextLeft: '+237655002318'),
          const SizedBox(
            height: 5,
          ),
          outputField(topTextLeft: 'N° Passport', bottomTextLeft: '06548578'),
          const SizedBox(
            height: 5,
          ),
          outputField(
              topTextLeft: 'Date de délivrance', bottomTextLeft: '13/12/2023'),
          const SizedBox(
            height: 5,
          ),
          outputField(
              topTextLeft: "Date d'expiration", bottomTextLeft: '13/12/2028'),
        ]
      ],
    ),
  );
}

class GetDataForm extends StatefulWidget {
  final ctx;
  final Function? callBackFunction;
  const GetDataForm({super.key, this.ctx, this.callBackFunction});

  @override
  State<GetDataForm> createState() =>
      _GetDataFormState(this.ctx, this.callBackFunction);
}

class _GetDataFormState extends State<GetDataForm> {
  var ctx;
  final callBackFunction;
  _GetDataFormState(this.ctx, this.callBackFunction);
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map inputData = {};
    bool boolValue = false;
    return SingleChildScrollView(
      child: AlertDialog(
        title: Container(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: const Text("Veillez confirmer votre identité")),
        content: Form(
          key: formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email",
                      style: TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)))),
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter a email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Mot de Pass",
                      style: TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)))),
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(229, 225, 225, 1),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text(
                      'Annuler',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(242, 78, 30, 1),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        boolValue = true;
                        inputData["email"] = emailController.text;
                        inputData["password"] = passwordController.text;
                        inputData["boolValue"] = boolValue;
                        callBackFunction(inputData);
                        print('inputData--> $inputData');
                        Navigator.of(ctx).pop();
                      } else {
                        boolValue = false;
                      }
                    },
                    child: const Text(
                      'Confirmer',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget controller({ctx}) {
//   final userController = TextEditingController();
//   return SingleChildScrollView(
//     child: Flexible(
//       fit: FlexFit.tight,
//       child: AlertDialog(
//         title: Container(
//             padding: const EdgeInsets.only(top: 15, bottom: 10),
//             child: const Text("Veillez confirmer votre identité")),
//         content: Form(
//           child: Column(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Email",
//                       style:
//                           TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 42,
//                     child: TextFormField(
//                       controller: userController,
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5.0)))),
//                       validator: (value) {
//                         if (value != null) {
//                           return 'Please enter a user';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Mot de Pass",
//                       style:
//                           TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   SizedBox(
//                     height: 42,
//                     child: TextFormField(
//                       controller: userController,
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(5.0)))),
//                       validator: (value) {
//                         if (value != null) {
//                           return 'Please enter a user';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(bottom: 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SizedBox(
//                   width: 100,
//                   height: 50,
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: const Color.fromRGBO(229, 225, 225, 1),
//                     ),
//                     onPressed: () {
//                       Navigator.of(ctx).pop();
//                     },
//                     child: const Text(
//                       'Annuler',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 100,
//                   height: 50,
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       backgroundColor: Color.fromRGBO(242, 78, 30, 1),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       'Confirmer',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget showdialog({ctx, changetxt}) {
  if (changetxt == 'Annuler' ||
      changetxt == 'Supprimer' ||
      changetxt == 'Relancer') {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
      ),
      child: AlertDialog(
        title: SizedBox(
          height: 120,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (changetxt != 'Relancer') ...[
                buildIconButtonSvg(
                  iconColor: const Color(0XFFF24E1E),
                  iconSvg: 'assets/recyclebin.svg',
                  fontSizeIcon: 35,
                ),
                const SizedBox(height: 15),
                if (changetxt == 'Supprimer') ...[
                  Text(
                    "Voulez vous Supprimer cette transaction ?",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ] else
                  Text(
                    "Voulez vous annuler cette transaction ?",
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 10),
                Text(
                  "Cette action sera irreversible",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 129, 123, 123),
                  ),
                ),
              ] else if (changetxt == 'Relancer') ...[
                buildIconButton(
                  iconColor: const Color(0XFFF24E1E),
                  fontSizeIcon: 35,
                  iconButton: Icons.loop,
                ),
                Text(
                  "Votre transaction sera relancée et vous pourrez être servir",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(229, 225, 225, 1),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text(
                      'Non',
                      style: TextStyle(
                          color: Color.fromARGB(255, 106, 99, 99),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(242, 78, 30, 1),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Oui',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } else {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
      ),
      child: AlertDialog(
        title: SizedBox(
          height: 120,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildIconButtonSvg(
                iconColor: const Color(0XFFF24E1E),
                iconSvg: 'assets/termine.svg',
                fontSizeIcon: 35,
              ),
              const SizedBox(height: 15),
              Text(
                "Confirmer les modifications",
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Les changement seront Sauvegardés",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 129, 123, 123),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(229, 225, 225, 1),
                    ),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text(
                      'Non',
                      style: TextStyle(
                          color: Color.fromARGB(255, 106, 99, 99),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(242, 78, 30, 1),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Oui',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class showDialogFilterSort extends StatefulWidget {
  String changetxt;
  BuildContext ctx;
  int currentTransaction;
  showDialogFilterSort(
      {super.key,
      required this.changetxt,
      required this.ctx,
      required this.currentTransaction});

  @override
  State<showDialogFilterSort> createState() => _showDialogFilterSortState(
      this.changetxt, this.ctx, this.currentTransaction);
}

class _showDialogFilterSortState extends State<showDialogFilterSort> {
  String changetxt;
  BuildContext ctx;
  int currentTransaction;
  int valueRadio = 0;
  bool isFirstDialog = true;
  _showDialogFilterSortState(this.changetxt, this.ctx, this.currentTransaction);

  List listCountry = ['En Attente', 'En Traitement'];
  var valueChoose;
  Map inputData = {};
  final formKey = GlobalKey<FormState>();
  final montantMinController = TextEditingController();
  final montantMaxController = TextEditingController();

  final dateControllerMin  = TextEditingController();
  final dateControllerMax = TextEditingController();
  @override
  void dispose() {
    montantMinController.dispose();
    montantMaxController.dispose();
    dateControllerMin.dispose();
    dateControllerMax.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    if (changetxt == 'Filtrer') {
      if (currentTransaction == 0 ||
          currentTransaction == 2 ||
          currentTransaction == 3) {
        return isFirstDialog == true
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                ),
                child: AlertDialog(
                  title: SizedBox(
                    height: 200,
                    width: 250,
                    child: Column(
                      children: [
                        Row(children: [
                          Row(children: [
                            buildIconButtonSvg(
                              iconColor: const Color(0XFFF24E1E),
                              iconSvg: 'assets/filter.svg',
                              fontSizeIcon: 45,
                            ),
                            const SizedBox(
                              width: 180,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(ctx).pop(),
                              child: SvgPicture.asset(
                                'assets/close.svg',
                                width: 15,
                                // ignore: deprecated_member_use
                                color: const Color(0XFFF24E1E),
                              ),
                            ),
                          ]),
                        ]),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              const Text('Date'),
                              const SizedBox(
                                width: 100,
                              ),
                              Radio(
                                  value: 1,
                                  groupValue: valueRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      print('valueRadio--> $valueRadio');
                                      valueRadio = value!;
                                      isFirstDialog = false;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              const Text('Montant'),
                              const SizedBox(
                                width: 70,
                              ),
                              Radio(
                                  value: 2,
                                  groupValue: valueRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      print('valueRadio--> $valueRadio');
                                      valueRadio = value!;
                                      isFirstDialog = false;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : secondDialog(valueRadio);
      } else {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
          ),
          child: AlertDialog(
            title: SizedBox(
              height: 330,
              width: 250,
              child: Column(
                children: [
                  Row(children: [
                    buildIconButtonSvg(
                      iconColor: const Color(0XFFF24E1E),
                      iconSvg: 'assets/filter.svg',
                      fontSizeIcon: 45,
                    ),
                    const SizedBox(
                      width: 180,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(ctx).pop(),
                      child: SvgPicture.asset(
                        'assets/close.svg',
                        width: 15,
                        // ignore: deprecated_member_use
                        color: const Color(0XFFF24E1E),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        const Text('Date'),
                        const SizedBox(
                          width: 103,
                        ),
                        Radio(
                            value: 1,
                            groupValue: valueRadio,
                            onChanged: (value) {
                              setState(() {
                                valueRadio = value!;
                                print('valueRadio--> $valueRadio');
                              });
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        const Text('Montant'),
                        const SizedBox(
                          width: 70,
                        ),
                        Radio(
                            value: 2,
                            groupValue: valueRadio,
                            onChanged: (value) {
                              setState(() {
                                valueRadio = value!;
                                print('valueRadio--> $valueRadio');
                              });
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: const [ 
                        Text("Status",
                            style: TextStyle(
                                color: Color(0XFF000000),
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 35,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(97, 97, 97, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButton(
                              hint: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "En Attente",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0XFF000000)),
                                ),
                              ),
                              icon: const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0XFFF24E1E),
                                ),
                              ),
                              iconSize: 40,
                              underline: const SizedBox(),
                              style: GoogleFonts.inter(
                                color: const Color(0XFF000000),
                              ),
                              value: valueChoose,
                              onChanged: (newValue) {
                                setState(() {
                                  valueChoose = newValue;
                                });
                              },
                              items: listCountry.map(
                                (valueCountry) {
                                  return DropdownMenuItem(
                                      value: valueCountry,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          valueCountry,
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ));
                                },
                              ).toList()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(229, 225, 225, 1),
                        ),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text(
                          'Annuler',
                          style: TextStyle(
                              color: Color.fromARGB(255, 106, 99, 99),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 45,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(242, 78, 30, 1),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Ok',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
        ),
        child: AlertDialog(
          title: SizedBox(
            height: 150,
            width: 250,
            child: Column(
              children: [
                Row(children: [
                  Row(children: [
                    buildIconButtonSvg(
                      iconColor: const Color(0XFFF24E1E),
                      iconSvg: 'assets/trier.svg',
                      fontSizeIcon: 45,
                    ),
                    const SizedBox(
                      width: 180,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(ctx).pop(),
                      child: SvgPicture.asset(
                        'assets/close.svg',
                        width: 15,
                        // ignore: deprecated_member_use
                        color: const Color(0XFFF24E1E),
                      ),
                    ),
                  ]),
                ]),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      const Text('Ascendant'),
                      const SizedBox(
                        width: 60,
                      ),
                      Radio(
                          value: 1,
                          groupValue: valueRadio,
                          onChanged: (value) {
                            setState(() {
                              valueRadio = value!;
                              print('valueRadio--> $valueRadio');
                            });
                          }),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      const Text('Descendant'),
                      const SizedBox(
                        width: 50,
                      ),
                      Radio(
                          value: 2,
                          groupValue: valueRadio,
                          onChanged: (value) {
                            setState(() {
                              valueRadio = value!;
                              print('valueRadio--> $valueRadio');
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(229, 225, 225, 1),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text(
                        'Annuler',
                        style: TextStyle(
                            color: Color.fromARGB(255, 106, 99, 99),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(242, 78, 30, 1),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Ok',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  secondDialog(valueRidio) {
    print('isFirstDialog in secondDialog--> $isFirstDialog');
    print('valueRadio in secondDialog--> $valueRadio');
    if (valueRadio == 1) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
        ),
        child: AlertDialog(
          title: SizedBox(
            height: 320,
            width: 250,
            child: Column(
              children: [
                Row(children: [
                  SvgPicture.asset(
                    'assets/filter.svg',
                    width: 35,
                    // ignore: deprecated_member_use
                    color: const Color(0XFFF24E1E),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(ctx).pop(),
                    child: SvgPicture.asset(
                      'assets/close.svg',
                      width: 15,
                      // ignore: deprecated_member_use
                      color: const Color(0XFFF24E1E),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    'Date',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left:16.0, right: 16.0),
                      child: Text("MIN",
                          style: TextStyle(
                              color: Color.fromARGB(255, 75, 71, 71),
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                SizedBox(
                  height: 75,
                  child: Padding(
                      padding: const EdgeInsets.only(left:16.0, right: 16.0, bottom:16.0),
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromRGBO(97, 97, 97, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            readOnly: true,
                            controller: dateControllerMin,
                            decoration: InputDecoration(
                              hintText: '22/05/2023',
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  var date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  if (date != null) {
                                    dateControllerMin.text =
                                        DateFormat('MM/dd/yyyy').format(date);
                                  }
                                },
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 40,
                                color: const Color(0XFFF24E1E),
                              ),
                            ),
                        )
                      )
                  ),
                ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text("MAX",
                          style: TextStyle(
                              color: Color.fromARGB(255, 83, 79, 79),
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 75,
                      child: Padding(
                          padding: const EdgeInsets.only(left:16.0, right: 16.0, bottom:16.0),
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromRGBO(97, 97, 97, 1)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                readOnly: true,
                                controller: dateControllerMax,
                                decoration: InputDecoration(
                                  hintText: '26/05/2023',
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    onPressed: () async {
                                      var date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2100));
                                      if (date != null) {
                                        dateControllerMax.text =
                                            DateFormat('MM/dd/yyyy')
                                                .format(date);
                                      }
                                    },
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 40,
                                    color: const Color(0XFFF24E1E),
                                  ),
                                ),
                              ))),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(229, 225, 225, 1),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: GoogleFonts.inter(
                            color: const Color.fromARGB(255, 67, 62, 62),
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(242, 78, 30, 1),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // boolValue = true;
                          inputData["dateMin"] = dateControllerMin.text;
                          inputData["dateMax"] = dateControllerMax.text;
                          // inputData["boolValue"] = boolValue;
                          // callBackFunction(inputData);
                          print('inputData--> $inputData');
                          Navigator.of(ctx).pop();
                        } else {
                          // boolValue = false;
                        }
                      },
                      child: Text(
                        'Ok',
                        style: GoogleFonts.inter(
                            color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
        ),
        child: AlertDialog(
          title: SizedBox(
            height: 280,
            width: 250,
            child: Column(
              children: [
                Row(children: [
                  SvgPicture.asset(
                    'assets/filter.svg',
                    width: 35,
                    // ignore: deprecated_member_use
                    color: const Color(0XFFF24E1E),
                  ),
                  const SizedBox(
                    width: 180,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(ctx).pop(),
                    child: SvgPicture.asset(
                      'assets/close.svg',
                      width: 15,
                      // ignore: deprecated_member_use
                      color: const Color(0XFFF24E1E),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text(
                    'Montant',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("MIN",
                                style: TextStyle(
                                    color: Color.fromRGBO(97, 97, 97, 1))),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 35,
                              child: TextFormField(
                                controller: montantMinController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)))),
                                validator: (value) {
                                  if (value == '') {
                                    return 'Please enter a email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("MAX",
                                style: TextStyle(
                                    color: Color.fromRGBO(97, 97, 97, 1))),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 35,
                              child: TextFormField(
                                controller: montantMaxController,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)))),
                                validator: (value) {
                                  if (value == '') {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(229, 225, 225, 1),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: GoogleFonts.inter(
                            color: const Color.fromARGB(255, 67, 62, 62),
                            fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(242, 78, 30, 1),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // boolValue = true;
                          inputData["montantMin"] = montantMinController.text;
                          inputData["montantMax"] = montantMaxController.text;
                          // inputData["boolValue"] = boolValue;
                          // callBackFunction(inputData);
                          print('inputData--> $inputData');
                          Navigator.of(ctx).pop();
                        } else {
                          // boolValue = false;
                        }
                      },
                      child: Text(
                        'Ok',
                        style: GoogleFonts.inter(
                            color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

Widget TansactionsTab(List<TransactionItem> transactions, String valueTab,
    bool isListTransaction) {
  List<TransactionItem> transaction = [];
  var map;
  switch (valueTab) {
    case 'Tout':
      return allTansactions(transactions, isListTransaction);

    case 'En cours':
      map = transactions.map((e) => e.status == 'Terminé' ? e : null);
      print('all---> ${map}');
      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].status == 'En Traitement' ||
            transactions[i].status == 'En Attente') {
          print('all---> ${transactions[i].status}');
          transaction.add(transactions[i]);
        }
      }
      return tansactionsEnCours(transaction, isListTransaction);

    case 'Réussies':
      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].status == 'Terminé') {
          print('all---> ${transactions[i].status}');
          transaction.add(transactions[i]);
        }
      }
      return tansactionReussies(transaction, isListTransaction);

    default:
      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].status == 'Annulé') {
          print('all---> ${transactions[i].status}');
          transaction.add(transactions[i]);
        }
      }
      return tansactionAnnuler(transaction, isListTransaction);
  }
}

Widget allTansactions(transactions, isListTransaction) {
  return Container(
    // color: const Color.fromARGB(255, 242, 236, 224),
    margin: const EdgeInsets.only(top: 130),
    height: 650,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          title: cardItem(transaction: transaction),
          onTap: () {
            print(
                'allTansactions---> onTap From MA_TransactionPage Inside  MA_callableWidget----');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TransactionScreen(
                    transaction: transactions,
                    index: index,
                    isListTransaction: isListTransaction)));
          },
        );
      },
    ),
  );
}

Widget tansactionReussies(transactions, isListTransaction) {
  return Container(
    margin: const EdgeInsets.only(top: 130),
    height: 650,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          title: cardItem(transaction: transaction),
          // Dismissible(
          //     key: Key(transaction.user),
          //     onDismissed: (direction) {
          //       // setState(() {
          //       //   transactions.removeAt(index);
          //       // });
          //       ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text("${transaction.user} supprimé")));
          //     },
          //     child: cardItem(transaction: transaction)
          //     ),
          onTap: () {
            print(
                'tansactionReussies---> onTap From MA_TransactionPage Inside  MA_callableWidget----');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TransactionScreen(
                    transaction: transactions,
                    index: index,
                    isListTransaction: isListTransaction)));
          },
        );
      },
    ),
  );
}

Widget tansactionsEnCours(transactions, isListTransaction) {
  return Container(
    margin: const EdgeInsets.only(top: 130),
    height: 650,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          title: cardItem(transaction: transaction),
          // Dismissible(
          //     key: Key(transaction.user),
          //     onDismissed: (direction) {
          //       // setState(() {
          //       //   transactions.removeAt(index);
          //       // });
          //       ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text("${transaction.user} supprimé")));
          //     },
          //     child: cardItem(transaction: transaction)
          //     ),
          onTap: () {
            print(
                'tansactionsEnCours---> onTap From MA_TransactionPage Inside  MA_callableWidget----');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TransactionScreen(
                    transaction: transactions,
                    index: index,
                    isListTransaction: isListTransaction)));
          },
        );
      },
    ),
  );
}

Widget tansactionAnnuler(transactions, isListTransaction) {
  return Container(
    margin: const EdgeInsets.only(top: 130),
    height: 650,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          title: cardItem(transaction: transaction),
          // Dismissible(
          //     key: Key(transaction.user),
          //     onDismissed: (direction) {
          //       // setState(() {
          //       //   transactions.removeAt(index);
          //       // });
          //       ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text("${transaction.user} supprimé")));
          //     },
          //     child: cardItem(transaction: transaction)
          //     ),
          onTap: () {
            print(
                'tansactionAnnuler---> onTap From MA_TransactionPage Inside  MA_callableWidget----');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TransactionScreen(
                    transaction: transactions,
                    index: index,
                    isListTransaction: isListTransaction)));
          },
        );
      },
    ),
  );
}
