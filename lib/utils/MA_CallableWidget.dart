import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'MA_TransactionItem.dart';
import 'MA_Widgets.dart';

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
    return tabDestinataire(callBackFunction, valueOfBool!, codeReception!);
  } else {
    return tabExpediteur();
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
              bottomTextLeft: transaction[index].status,
              svgLink: 'assets/termine.svg',
              color: Color(0xFFFFC700)),
        ] else
        outputField(
              topTextLeft: 'Status',
              bottomTextLeft: transaction[index].status,
              svgLink: 'assets/spinner.svg',
              color: Color(0xFFF24E1E)),
        const SizedBox(
          height: 10,
        ),
        outputField(
            topTextLeft: 'Status',
            bottomTextLeft: transaction[index].status,
            topTextRight: 'Frais',
            bottomTextRight_Int: frais),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(top: 15),
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    // margin: const EdgeInsets.only(right: 25),
                    child: Text(
                      '${int.parse(transaction[index].amont) + frais}\$',
                      style: TextStyle(
                          color: Color.fromRGBO(246, 60, 3, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
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

Widget tabDestinataire(
    Function? callBackFunction, bool valueOfBool, String codeReception) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
    child: Container(
      child: Column(
        children: [
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
              topTextLeft: 'N° Téléphone',
              bottomTextLeft: '+237655002318'),
          const SizedBox(
            height: 25,
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
                child: Container(
                  margin: const EdgeInsets.only(left: 55),
                  child: GestureDetector(
                    onTap: () {
                      callBackFunction!('Open_pop_up');
                    },
                    child: Text(
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
        ],
      ),
    ),
  );
}

Widget tabExpediteur() {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Container(
      child: Column(
        children: [
          outputField(topTextLeft: 'Nom de léexpéditeur',bottomTextLeft: 'Robert Boum'),
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
          outputField(topTextLeft: 'N° Téléphone',bottomTextLeft: '+237655002318'),
          const SizedBox(
            height: 5,
          ),
          outputField(topTextLeft: 'N° Passport', bottomTextLeft: '06548578'),
          const SizedBox(
            height: 5,
          ),
          outputField(topTextLeft: 'Date de délivrance', bottomTextLeft: '13/12/2023'),
          const SizedBox(
            height: 5,
          ),
          outputField(topTextLeft: "Date d'expiration", bottomTextLeft: '13/12/2028'),
        ],
      ),
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

  Widget build(BuildContext context) {
    Map inputData = {};
    String email;
    var password;
    bool boolValue = false;
    return SingleChildScrollView(
      child: Container(
        child: AlertDialog(
          title: Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("Veillez confirmer votre identité")),
          content: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Email",
                          style:
                              TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
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
                ),
                SizedBox(height: 15),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Mot de Pass",
                          style:
                              TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
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
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(229, 225, 225, 1),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(242, 78, 30, 1),
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
                      child: Text(
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
      ),
    );
  }
}

Widget controller({ctx}) {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  return SingleChildScrollView(
    child: Flexible(
      fit: FlexFit.tight,
      child: Container(
        child: AlertDialog(
          title: Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text("Veillez confirmer votre identité")),
          content: Form(
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Email",
                          style:
                              TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 42,
                        child: TextFormField(
                          controller: userController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)))),
                          validator: (value) {
                            if (value != null) {
                              return 'Please enter a user';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Mot de Pass",
                          style:
                              TextStyle(color: Color.fromRGBO(97, 97, 97, 1))),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 42,
                        child: TextFormField(
                          controller: userController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)))),
                          validator: (value) {
                            if (value != null) {
                              return 'Please enter a user';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(229, 225, 225, 1),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(242, 78, 30, 1),
                      ),
                      onPressed: () {},
                      child: Text(
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
      ),
    ),
  );
}
