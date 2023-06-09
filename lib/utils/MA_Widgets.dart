import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'MA_Styles.dart';
import 'MA_TransactionItem.dart';

Widget myTextField({text, String? icon, bool, TextEditingController? controller,Function? validator}) {
  return Container(
    height: 50,
    child: TextFormField(

      validator: (input)=> validator!(input),
      obscureText: bool,
      controller: controller,
      decoration: InputDecoration(
          contentPadding:EdgeInsets.only(top: 5),
        //  errorStyle: TextStyle(fontSize: 14),
          hintStyle: TextStyle(
            color: AppColors.genderTextColor,
          ),
          hintText: text,
          prefixIcon: Image.asset(
            icon!,
            cacheHeight: 20,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    ),
  );
}

Widget elevatedButton({text, Function? onpress, width, height}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: AppColors.orange,
    ),
    onPressed: () {
      onpress!();
    },
    child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),


  );
}

/*Widget elevateButtonRight({text, Function? onpress, Icon? icon}) {
  return ElevatedButton(
    onPressed: () {},
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Download'), // <-- Text
        SizedBox(
        width: 5,
        ),
        Icon(icon),
      ],
    ),
    );
}*/

Widget elevatedButtonright({text, Function? onpress, width, height, icon}){
  return ElevatedButton.icon(   // <-- ElevatedButton
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width, height),
      backgroundColor: AppColors.orange,
    ),
    onPressed: () {
      onpress!();
    },
    label: Text(
      text,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    icon: icon,
  );
}

Widget textButton({text, fontSize, Color? color}){
    return TextButton(
      onPressed: null,
      child: Text(text, style: GoogleFonts.dmSans(color: color, fontSize: fontSize),),
      );
}

Widget myText({text, style, textAlign}) {
  return Text(
    text,
    style: style,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
  );
}

Widget socialAppsIcons({text,Function? onPressed}) {
  return InkWell(
    onTap: ()=> onPressed!(),
    child: Container(
      margin: EdgeInsets.all(10),
      width: 48,
      height: 48,
      decoration: BoxDecoration(

        image: DecorationImage(
          image: AssetImage(text),
        ),
      ),
    ),
  );
}



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

/**
 * William Ndongmo
 * 
 * Call the buildIconButton widget as following
 * buildIconButton(
 *                  iconColor: your_iconColor
 *                  IconData: your_IconData
 *                  iconButton: your_iconButton
 *                  buttonText: your_buttonText
 *                  fontSizeText: your_fontSizeText
 *                  fontSizeIcon: your_fontSizeIcon
 *                  callBackFunction: your_callBackFunction)
 * your_callBackFunction is a function that get the name of the icon that was clicked
 */
Widget buildIconButton(
    {Color? iconColor,
    required IconData iconButton,
    String? buttonText,
    double? fontSizeText,
    double? fontSizeIcon,
    Function? callBackFunction}) {
  if (buttonText != '') {
    print('---> $buttonText');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: fontSizeIcon,
          icon: Icon(iconButton, color: iconColor),
          onPressed: () {
            callBackFunction!(buttonText);
          },
        ),
        Text(
          buttonText!,
          style: TextStyle(color: iconColor, fontSize: fontSizeText),
        ),
      ],
    );
  } else {
    var label = 'WithoutLabel';
    return Column(
      children: [
        IconButton(
          iconSize: fontSizeIcon,
          icon: Icon(iconButton, color: iconColor),
          onPressed: () {
            callBackFunction!(label);
          },
        ),
      ],
    );
  }
}

/**
 * William Ndongmo
 * 
 * Call the buildIconButtonSvg widget as following
 * buildIconButton(
 *                  iconColor: your_iconColor
 *                  IconData: your_IconData
 *                  iconSvg: your_svgPath
 *                  buttonText: your_buttonText
 *                  fontSizeText: your_fontSizeText
 *                  fontSizeIcon: your_fontSizeIcon
 *                  callBackFunction: your_callBackFunction)
 * your_callBackFunction is a function that get the name of the icon that was clicked
 */
Widget buildIconButtonSvg(
    {Color? iconColor,
    // required IconData iconButton,
    String? buttonText,
    String? iconSvg,
    double? fontSizeText,
    double? fontSizeIcon,
    Function? callBackFunction}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    // mainAxisSize: MainAxisSize.min,
    children: [
      GestureDetector(
        onTap: () {
          callBackFunction!(buttonText);
        },
        child: SvgPicture.asset(
          iconSvg!,
          width: fontSizeIcon,
          // ignore: deprecated_member_use
          color: iconColor,
        ),
      ),
    ],
  );
}

/**
 * William Ndongmo
 * 
 * Call the cardItem widget as following
 * cardItem(transaction: transaction)
 * transaction  est une liste de transaction
 */
Widget cardItem({required TransactionItem transaction}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
    ),
    margin: EdgeInsets.all(8),
    elevation: 8,
    child: Container(
      padding: const EdgeInsets.all(12),
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
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 1.0,
                                color: Color.fromARGB(255, 128, 130, 132)),
                          ),
                          // color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${transaction.city}, ${transaction.date}',
                                      style:
                                          TextStyle(color: Colors.grey[500])),
                                ],
                              ),
                            ),
                            Text(transaction.status,
                                style: TextStyle(color: Colors.grey[500])),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transaction.user),
                          const SizedBox(height: 10),
                          Text(transaction.amont,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 0),
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                if (transaction.icon == "check") {
                                  return const Icon(Icons.check_circle,
                                      color: Colors.green);
                                } else if (transaction.icon == "Autorenew") {
                                  return const Icon(Icons.autorenew,
                                      color: Colors.yellow);
                                } else {
                                  return const Icon(Icons.cancel,
                                      color: Colors.red);
                                }
                              })
                              //
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

/**
 * William Ndongmo
 * 
 * Call the getFooter widget as following
 * getFooter(callBackFunction: myFunction)
 * myFunction is a function that get the name of the icon that was clicked
 */
class getFooter extends StatefulWidget {
  final Function callBackFunction;
  const getFooter({super.key, required this.callBackFunction});

  @override
  State<getFooter> createState() => _getFooterState(this.callBackFunction);
}

class _getFooterState extends State<getFooter> {
  Function callBackFunction;

  _getFooterState(this.callBackFunction);

  int _currentIndex = 0;
  final tabs = ['Home', 'Transaction', 'Devises', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Color.fromARGB(255, 128, 130, 132)),
        ),
        // color: Colors.white,
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 15,
        // unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/transaction.svg',
              width: 25,
              // ignore: deprecated_member_use
              color: _currentIndex == 1
                  ? Color.fromRGBO(242, 78, 30, 1)
                  : Color.fromRGBO(97, 97, 97, 1),
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/devises.svg',
              width: 25,
              // ignore: deprecated_member_use
              color: _currentIndex == 2
                  ? Color.fromRGBO(246, 60, 3, 1)
                  : Color.fromRGBO(97, 97, 97, 1),
            ),
            label: 'Devises',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/settings.svg',
              width: 25,
              // ignore: deprecated_member_use
              color: _currentIndex == 3
                  ? Color.fromRGBO(246, 60, 3, 1)
                  : Color.fromRGBO(97, 97, 97, 1),
            ),
            label: 'Sttings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            callBackFunction(tabs[_currentIndex]);
          });
        },
      ),
    );
  }
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
