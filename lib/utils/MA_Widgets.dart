import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/MA_DevisesPage.dart';
import '../views/MA_SettingsPage.dart';
import '../views/MA_TransactionPage.dart';
import '../views/homePage/MA_homePage.dart';
import 'MA_Styles.dart';
import 'MA_TransactionItem.dart';

Widget myTextField(
    {text,
    String? icon,
    bool,
    TextEditingController? controller,
    Function? validator}) {
  return Container(
    height: 50,
    child: TextFormField(
      validator: (input) => validator!(input),
      obscureText: bool,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 5),
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
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
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

Widget elevatedButtonright({text, Function? onpress, width, height, icon}) {
  return ElevatedButton.icon(
    // <-- ElevatedButton
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

Widget textButton({text, fontSize, Color? color}) {
  return TextButton(
    onPressed: null,
    child: Text(
      text,
      style: GoogleFonts.dmSans(color: color, fontSize: fontSize),
    ),
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

Widget socialAppsIcons({text, Function? onPressed}) {
  return InkWell(
    onTap: () => onPressed!(),
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
 * transaction  est une liste d'elements
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
                                      style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontStyle: FontStyle.normal,
                                              color: Color.fromARGB(255, 136, 134, 134),),
                                        ),
                                ],
                              ),
                            ),
                            if (transaction.status == 'En Traitement' ||
                                transaction.status == 'En Attente') ...[
                              Text('En cours',
                                  style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 136, 134, 134),
                                ),
                              ),
                            ] else
                              Text(transaction.status,
                                  style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 136, 134, 134),
                                ),
                              ),
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
                          if (transaction.status == 'En Traitement') ...[
                            Text(transaction.user,
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 40, 38, 38),
                                )
                              ),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                Text('Status: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Text(transaction.status,
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromARGB(255, 40, 38, 38),
                                    )
                                ),
                              ],
                            ),
                          ] else if (transaction.status == 'En Attente') ...[
                            Text(transaction.user,
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 40, 38, 38),
                                )),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                Text('Status: ',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text(transaction.status,
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromARGB(255, 40, 38, 38),
                                    )
                                ),
                              ],
                            ),
                          ] else
                            Text(transaction.user,
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  color: Color.fromARGB(255, 40, 38, 38),
                                )),
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
                              margin: const EdgeInsets.only(right: 15),
                              child: LayoutBuilder(
                                  builder: (context, constraints) {
                                if (transaction.icon == "check") {
                                  return SvgPicture.asset(
                                    'assets/termine.svg',
                                    width: 35,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFF2ADFB6),
                                  );
                                } else if (transaction.icon == "traitement") {
                                  return SvgPicture.asset(
                                    'assets/spinner.svg',
                                    width: 35,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFFFFC700),
                                  );
                                } else {
                                  return SvgPicture.asset(
                                    'assets/spinner.svg',
                                    width: 35,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFFF24E1E),
                                  );
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
  
  var check;

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
            print('currenrIndex--> $_currentIndex');
            callBackFunction(_currentIndex);
            if (_currentIndex == 0) {
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TransactionListScreen(check: check,)));
            } else if (_currentIndex == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TransactionPage(index: check,)));
            } else if (_currentIndex == 2) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DevisesPage()));
            } else if (_currentIndex == 3) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            }
          });
        },
      ),
    );
  }
}
