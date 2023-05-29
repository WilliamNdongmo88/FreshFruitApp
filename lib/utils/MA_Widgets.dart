import 'package:flutter/material.dart';
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

/**
 * William Ndongmo
 */
Widget buildIconButton({Color? iconColor,IconData? iconButton,String? buttonText,double? fontSizeText,double? fontSizeIcon,Function? callBackFunction}) {// double fontSizeText, double fontSizeIcon,

  if (buttonText != '') {
    print('---> $buttonText');
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
    return Column(
      children: [
        Icon(iconButton, color: iconColor, size: fontSizeText),
      ],
    );
  }
}
/**
 * William Ndongmo
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
/**
 * William Ndongmo
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
          top:
              BorderSide(width: 1.0, color: Color.fromARGB(255, 128, 130, 132)),
        ),
        // color: Colors.white,
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 15,
        // unselectedFontSize: 12,
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
            callBackFunction!(tabs[_currentIndex]);
          });
        },
      ),
    );
  }
}

