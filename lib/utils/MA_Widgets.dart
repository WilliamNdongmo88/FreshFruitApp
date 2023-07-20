import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/MA_DevisesPage.dart';
import '../views/MA_SettingsPage.dart';
import '../views/MA_TransactionPage.dart';
import '../views/homePage/MA_homePage.dart';
import 'MA_Styles.dart';
import 'MA_TransactionItem.dart';

Widget myTextField(
    {label,
    text,
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
        contentPadding: EdgeInsets.only(top: 5, bottom: 0),
        //  errorStyle: TextStyle(fontSize: 14),
        hintStyle: TextStyle(
          fontSize: 18,
          color: AppColors.genderTextColor,
        ),
        labelStyle: TextStyle(fontSize: 18, color: AppColors.grayText),
        hintText: text,
        labelText: label,
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
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

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
      style: const TextStyle(
        fontSize: 18,
      ),
    ),
    icon: icon,
  );
}

Widget textButton({text, Function? onpress, fontSize, Color? color}) {
  return TextButton(
    onPressed: () {
      onpress!();
    },
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
      margin: const EdgeInsets.all(10),
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

/// William Ndongmo
///
/// Call the outputField widget as following
/// outputField(
///                  topTextLeft: your_topTextLeft
///                  bottomTextLeft: your_bottomTextLeft
///                  topTextRight: your_topTextRight
///                  bottomTextRight_String: your_bottomTextRight_String
///                  bottomTextRight_Int: your_bottomTextRight_Int
///                  svgLink: your_svgLink
///                  color: your_color)
/// your_callBackFunction is a function that get the name of the icon that was clicked
Widget outputField({
  String topTextLeft = '',
  String bottomTextLeft = '',
  String topTextRight = '',
  String bottomTextRight_String = '',
  int? bottomTextRight_Int,
  String svgLink = '',
  Color? color,
}) {
  return Container(
    margin: EdgeInsets.only(top: 5.r),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 0.5.w, color: const Color.fromARGB(255, 128, 130, 132)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topTextLeft,
                  style: TextStyle(
                      color: const Color.fromRGBO(79, 79, 79, 1),
                      fontSize: 15.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (bottomTextRight_Int != null) ...[
                  Text(
                    '\$$bottomTextLeft.00',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ] else if (bottomTextLeft != '') ...[
                  Text(
                    bottomTextLeft,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ]
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 25.r),
            child: SvgPicture.asset(svgLink,
                width: 30.w,
                // ignore: deprecated_member_use
                color: color),
          ),
          if (bottomTextRight_Int != null) ...[
            Container(
              margin: EdgeInsets.only(right: 75.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topTextRight,
                    style: const TextStyle(
                        color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  Text(
                    '\$$bottomTextRight_Int.00',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ] else if (bottomTextRight_String != '') ...[
            Container(
              margin: EdgeInsets.only(right: 75.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topTextRight,
                    style: TextStyle(
                        color: const Color.fromRGBO(79, 79, 79, 1),
                        fontSize: 15.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    bottomTextRight_String,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ]
        ],
      ),
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
/// William Ndongmo
///
/// Call the buildIconButton widget as following
/// buildIconButton(
///                  iconColor: your_iconColor
///                  IconData: your_IconData
///                  iconButton: your_iconButton
///                  buttonText: your_buttonText
///                  fontSizeText: your_fontSizeText
///                  fontSizeIcon: your_fontSizeIcon
///                  callBackFunction: your_callBackFunction)
/// your_callBackFunction is a function that get the name of the icon that was clicked
Widget buildIconButton(
    {Color? iconColor,
    required IconData iconButton,
    String? buttonText = '',
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
/// William Ndongmo
///
/// Call the buildIconButtonSvg widget as following
/// buildIconButtonSvg(
///                  iconColor: your_iconColor
///                  IconData: your_IconData
///                  iconSvg: your_svgPath
///                  buttonText: your_buttonText
///                  fontSizeText: your_fontSizeText
///                  fontSizeIcon: your_fontSizeIcon
///                  callBackFunction: your_callBackFunction)
/// your_callBackFunction is a function that get the name of the icon that was clicked
Widget buildIconButtonSvg(
    {Color? iconColor,
    String? buttonText = 'WithoutLabel',
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
/// William Ndongmo
///
/// Call the cardItem widget as following
/// cardItem(transaction: transaction)
/// transaction  est une liste d'elements
Widget cardItem({required TransactionItem transaction}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
    ),
    margin: EdgeInsets.all(8.r),
    elevation: 8.h,
    child: Container(
      padding: EdgeInsets.only(left: 12.r, right: 12.r, top: 5.r, bottom: 5.r),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2.r),
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
                                    '${transaction.inZoneCountry}, ${transaction.date}',
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontStyle: FontStyle.normal,
                                      color: const Color.fromARGB(
                                          255, 136, 134, 134),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (transaction.status == 'OPEN' ||
                                transaction.status == 'En Attente') ...[
                              Text(
                                'En cours',
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  fontStyle: FontStyle.normal,
                                  color:
                                      const Color.fromARGB(255, 136, 134, 134),
                                ),
                              ),
                            ] else
                              Text(
                                transaction.status,
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color:
                                      const Color.fromARGB(255, 136, 134, 134),
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
                          if (transaction.status == 'OPEN') ...[
                            Text(transaction.user,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 40, 38, 38),
                                )),
                            SizedBox(height: 7.h),
                            Row(
                              children: [
                                Text('Status: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp)),
                                Text('En Traitement',
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          const Color.fromARGB(255, 40, 38, 38),
                                    )),
                              ],
                            ),
                          ] else if (transaction.status == 'En Attente') ...[
                            Text(transaction.user,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 40, 38, 38),
                                )),
                            const SizedBox(height: 7),
                            Row(
                              children: [
                                Text(
                                  'Status: ',
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(transaction.status,
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontStyle: FontStyle.normal,
                                      color:
                                          const Color.fromARGB(255, 40, 38, 38),
                                    )),
                              ],
                            ),
                          ] else
                            Text(transaction.user,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontStyle: FontStyle.normal,
                                  color: const Color.fromARGB(255, 40, 38, 38),
                                )),
                          const SizedBox(height: 10),
                          Text('\$${transaction.amont}.00',
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
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFF2ADFB6),
                                  );
                                } else if (transaction.icon == "traitement") {
                                  return SvgPicture.asset(
                                    'assets/spinner.svg',
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFFFFC700),
                                  );
                                } else if (transaction.icon == "attente") {
                                  return SvgPicture.asset(
                                    'assets/spinner.svg',
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFFF24E1E),
                                  );
                                } else {
                                  return SvgPicture.asset(
                                    'assets/cancel.svg',
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    color: const Color(0xFFFFF0000),
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

/// William Ndongmo
///
/// Call the getFooter widget as following
/// getFooter(callBackFunction: myFunction)
/// myFunction is a function that get the name of the icon that was clicked
class getFooter extends StatefulWidget {
  int currentIndex;
  final Function callBackFunction;
  getFooter(
      {super.key, required this.callBackFunction, required this.currentIndex});

  @override
  State<getFooter> createState() =>
      _getFooterState(this.callBackFunction, this.currentIndex);
}

class _getFooterState extends State<getFooter> {
  Function callBackFunction;
  int currentIndex;

  _getFooterState(this.callBackFunction, this.currentIndex);
  final tabs = ['Home', 'Transaction', 'Devises', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top:
              BorderSide(width: 1.w, color: const Color.fromARGB(255, 128, 130, 132)),
        ),
        // color: Colors.white,
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 15,
        // unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/home.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 0
                  ? const Color.fromRGBO(242, 78, 30, 1)
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/transactions.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 1
                  ? const Color.fromRGBO(242, 78, 30, 1)
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/devise.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 2
                  ? const Color.fromRGBO(246, 60, 3, 1)
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: 'Devises',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/setting.svg',
              width: 25.sp,
              // ignore: deprecated_member_use
              color: currentIndex == 3
                  ? const Color.fromRGBO(246, 60, 3, 1)
                  : const Color.fromRGBO(97, 97, 97, 1),
            ),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print('currenrIndex--> $currentIndex');
            callBackFunction(currentIndex);
            if (index == 0) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      TransactionListScreen(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            } else if (index == 1) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      TransactionPage(
                          isListTransaction: true, currentTransaction: 0),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            } else if (index == 2) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      DevisesPage(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            } else if (index == 3) {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 100),
                  pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                      SettingsPage(),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return Align(
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            }
            // if (currentIndex == 0) {
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionListScreen()));
            // } else if (currentIndex == 1) {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => TransactionPage(
            //           isListTransaction: true, currentTransaction: 0)));
            // } else if (currentIndex == 2) {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => const DevisesPage()));
            // } else if (currentIndex == 3) {
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => const SettingsPage()));
            // }
          });
        },
      ),
    );
  }
}

/*Widget dropDownbouton({controller, menuItem, itemType}){
    return DropdownButtonFormField(
      initialSelection: ColorLabel.green,
      controller: controller,
      label: const Text('Color'),
      dropdownMenuEntries: menuItem,
      onSelected: (ColorLabel? color) {
        setState(() {
          selectedColor = color;
        });
      },
    );
}*/

/*Widget dropDownmenuWithSearch({controller, menuItem, itemType}){
  return DropdownMenu<IconLabel>(
      controller: controller,
      enableFilter: false,
      leadingIcon: const Icon(Icons.search),
      label: const Text('Icon'),
      dropdownMenuEntries: menuItem,
      inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      ),
      onSelected: (itemType? icon) {
        setState(() {
        selectedIcon = icon;
        });

      },
   );
}*/


