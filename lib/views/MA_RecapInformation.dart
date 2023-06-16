import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../MA_TransactionStepper.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/':(context) =>const TransactionInfo(
            selectedGender: '',
            CountrySender:'',
            CountryReceiver:'',
            amountController:'',
            NameBank:'',
            IntituleBank:'',
            numberAccount:'',
            receptionCode:'',
            NameReceiver:'',
            PhoneNumber:'',
            CountryReception:'',
            CityReception:'',
            currentStep :0
        ),
        '/pg2':(context) =>transfertForm(),
      },
    );
  }
}

class TransactionInfo extends StatefulWidget {
  const TransactionInfo(
      {Key? key,
        required this.selectedGender,
        required this.CountrySender,
        required this.CountryReceiver,
        required this.amountController,
        required this.NameBank,
        required this.IntituleBank,
        required this.numberAccount,
        required this.receptionCode,
        required this.NameReceiver,
        required this.PhoneNumber,
        required this.CountryReception,
        required this.CityReception,
        required this.currentStep
      }) : super(key: key);



  // currentStep
  final int currentStep;
  //Bancaire Reception

  final  String selectedGender;
  final  String CountrySender ;
  final  String CountryReceiver;
  final  String amountController;
  final  String NameBank;
  final  String IntituleBank;
  final  String numberAccount;
  final  String receptionCode;

  // Manual Reception
  final  String NameReceiver;
  final  String PhoneNumber;
  final  String CountryReception;
  final  String CityReception;

  @override
  State<TransactionInfo> createState() => _TransactionInfoState();
}

class _TransactionInfoState extends State<TransactionInfo> {
  var text ='';
  void funChange (){
    /*Navigator.of(context, rootNavigator: true).pushNamed("/pg2",arguments: '${widget.currentStep}');*/
    /*Navigator.of(context).pushReplacementNamed();*/
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => transfertForm(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body:  SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildIconButton(
                          iconColor: Color.fromRGBO(17, 16, 15, 1),
                          iconButton: Icons.arrow_back_ios,
                          buttonText: '',
                          fontSizeIcon: 35,
                          callBackFunction: funChange),
                      Container(
                        margin: EdgeInsets.only(top:0),
                        child: const Text(
                          "Transaction d'argent",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    height:590,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 2.0,
                            offset: Offset(
                              -5.0, // Move to right 7.0 horizontally
                              10.0, // Move to bottom 8.0 Vertically
                            ))
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                                child: Text('Vérifier les informations sur la transaction', style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15))),
                            const SizedBox(height: 5),
                            if ('${widget.selectedGender}' == 'manuel') ...[
                              Container(
                                child: Column(
                                  children: [
                                    fieldInput(topText:'Pays envoi',bottomText:'${widget.CountrySender}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Pays de reception',bottomText:'${widget.CountrySender}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Montant',bottomText:'${widget.amountController}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Nom du destinataire',bottomText:'${widget.NameReceiver}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Pays et ville du destinataire',bottomText:'${widget.CountryReception}'+','+'${widget.CityReception}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'N°Telephone',bottomText:'${widget.PhoneNumber}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Code de Réception',bottomText:'${widget.receptionCode}',svgLink:'assets/material-symbols_edit.svg'),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text('NB: le code de réception est à transmettre uniquement à votre récépteur. + $text', style: TextStyle(color: Color(0xFF6F6F6F))),
                                    ),
                                  ],
                                ),
                              )
                            ]else if ('${widget.selectedGender}' == 'bancaire') ...[
                              Container(
                                child: Column(
                                  children: [
                                    fieldInput(topText:'Pays envoi',bottomText:'${widget.CountrySender}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Pays de reception',bottomText:'${widget.CountryReceiver}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Montant',bottomText:'${widget.amountController}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Nom de la Banque',bottomText:'${widget.NameBank}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'intitulé du ',bottomText:'${widget.IntituleBank}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'N°Compte',bottomText:'${widget.numberAccount}',svgLink:'assets/material-symbols_edit.svg'),
                                    fieldInput(topText:'Code de Réception',bottomText:'${widget.receptionCode}',svgLink:'assets/material-symbols_edit.svg'),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text('NB: le code de réception est à transmettre uniquement à votre récépteur.', style: TextStyle(color: Color(0xFF6F6F6F))),
                                    ),
                                  ],
                                ),
                              )
                            ]
                          ],
                        )),
                  ),
                ),
                Positioned(
                  top: 590,
                  left: 30,
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width:160,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange, // background (button) color
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Annuler'),
                              ],
                            ),
                            onPressed: (){

                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        SizedBox(
                          width:160,
                          child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange, // background (button) color
                            ),
                            onPressed: (){

                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Confirmer'), // <-- Text
                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: getFooter(callBackFunction: funChange),
      );

  }

  Widget fieldInput({//material-symbols_edit
    required String topText,
    required String bottomText,
    required String svgLink,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration:  const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topText,
                  style: const TextStyle(
                      color: Color.fromRGBO(79, 79, 79, 1), fontSize: 15),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  bottomText,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25), //'assets/spinner.svg'
            child: SvgPicture.asset(svgLink,
                width: 15,
                // ignore: deprecated_member_use
                color: Color.fromRGBO(246, 60, 3, 1)),
          ),
        ],
      ),
    );
  }

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
              callBackFunction!();
            },
          ),
        ],
      );
    }
  }
}

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
            label: 'Home',
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
            label: 'Translation',
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
