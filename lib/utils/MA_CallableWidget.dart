import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//Will Code Start

Widget fieldInput({
  required String topText,
  required String bottomText,
  required String svgLink,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 15),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topText,
                style: TextStyle(
                    color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                bottomText,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 5), //'assets/spinner.svg'
          child: SvgPicture.asset(svgLink,
              width: 30,
              // ignore: deprecated_member_use
              color: Color.fromRGBO(246, 60, 3, 1)),
        ),
      ],
    ),
  );
}

Widget tabDetails(
    {String? valueTab,
    Function? callBackFunction,
    bool? valueOfBool,
    String? codeReception}) {
  if (valueTab == 'Transaction') {
    return tabTransaction();
  } else if (valueTab == 'Destinataire') {
    print('-->codeReception $codeReception');
    return tabDestinataire(callBackFunction, valueOfBool!, codeReception!);
  } else {
    return tabExpediteur();
  }
}

Widget tabTransaction() {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30),
    child: Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "N° Transaction",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '65214789471',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Date de creation",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '26/05/2023',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: fieldInput(
                topText: 'Status',
                bottomText: 'En Attente',
                svgLink: 'assets/spinner.svg'),
            // Container(
            //   margin: const EdgeInsets.only(top: 15),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: const [
            //             Text(
            //               "Status",
            //               style: TextStyle(
            //                   color: Color.fromRGBO(79, 79, 79, 1),
            //                   fontSize: 15),
            //             ),
            //             SizedBox(
            //               height: 10,
            //             ),
            //             Text(
            //               'En Attente',
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontSize: 15,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(bottom: 5),
            //         child: SvgPicture.asset('assets/spinner.svg',
            //             width: 30,
            //             // ignore: deprecated_member_use
            //             color: Color.fromRGBO(246, 60, 3, 1)),
            //       ),
            //     ],
            //   ),
            // ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Montant",
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '450 USD',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Frais",
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '20 USD',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        // margin: const EdgeInsets.only(left: 25),
                        child: Text(
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
                        '470 USD',
                        style: TextStyle(
                            color: Color.fromRGBO(246, 60, 3, 1),
                            fontSize: 35,
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
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Nom du destinataire",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Robert Boum',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Pays",
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Cameroon',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Ville",
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Yaoundé',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "N° Téléphone",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '+237655002318',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
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
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Nom de léexpéditeur",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Robert Boum',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Pays",
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'USA',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Ville",
                          style: TextStyle(
                              color: Color.fromRGBO(79, 79, 79, 1),
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'New York',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "N° Téléphone",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '+237655002318',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "N° Passport",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '06548578',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Date de délivrance",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '13/12/2023',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(255, 128, 130, 132)),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Date d'expiration",
                    style: TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '13/12/2028',
                    style: TextStyle(
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
