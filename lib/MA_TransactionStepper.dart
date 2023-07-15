import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:money_app/controller/MA_DataController.dart';
import 'package:money_app/controller/Helper classes/MA_Helper_TransfertInformation.dart';
import 'package:money_app/controller/Helper classes/MA_Helper_Bank.dart';
import 'package:money_app/controller/Helper classes/MA_Helper_Manual.dart';
import 'package:money_app/utils/MA_TransactionItemDetails.dart';
import 'package:money_app/utils/MA_Widgets.dart';
import 'package:money_app/views/homePage/MA_homePage.dart';

import 'controller/Helper classes/MA_Helper_City.dart';
import 'controller/Helper classes/MA_Helper_Country.dart';

class transfertForm extends StatefulWidget {
  const transfertForm({Key? key}) : super(key: key);

  @override
  State<transfertForm> createState() => _transfertFormState();
}

class _transfertFormState extends State<transfertForm> {
  final ScrollController _controllerOne = ScrollController();
  int currentStep = 0;
  int _Amount = 0;
  bool displayManualRecap = false;
  bool displayBankRecap = false;
  String _selectedGender = 'manuel';

  // country Sender
  String dropdownvalueSender = 'USA';

  // country Receiver
  String dropdownvalueReceiver = 'USA';

  // country Receiver
  String dropdownvalueCountryReception = 'USA';
  String dropdownvalueCityReception = 'USA';

  final DataController dataController = Get.find<DataController>();
  late List<MA_Helper_Country> countryList;

  late List<MA_Helper_City> cityListSender;
  late List<MA_Helper_City> cityListReceiver;

  MA_Helper_Country? selectedCountrySender;
  MA_Helper_City? selectedCitySender;
  MA_Helper_Country? selectedCountryReceiver = null;
  MA_Helper_City? selectedCityReceiver = null;

  @override
  void initState() {
    super.initState();
    countryList = dataController.CountryListToDispatch.value;
    cityListSender = [];
    cityListReceiver = [];

    print("****** in InitState Country List ******* $countryList\n ");
    print(countryList);
    for (var country in countryList) {
      print("*** in initState  **** \n");
      print(country.name);
    }
  }

  //retrieve value from Montant input
  TextEditingController amountController = TextEditingController();

  //Bank Reception Mode
  TextEditingController NameBank = TextEditingController();
  TextEditingController IntituleBank = TextEditingController();
  TextEditingController numberAccount = TextEditingController();
  TextEditingController receptionCode = TextEditingController();

  //Manuel Reception Mode
  TextEditingController NameReceiver = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();

  bool displayError = false;

  void funcBack() {
    if (currentStep == 0) {
      print('go back');
    } else if (currentStep == 1) {
      setState(() {
        currentStep -= 1;
      });
    } else if (currentStep == 2) {
      setState(() {
        currentStep -= 1;
      });
    }
  }

  void funChange(changetxt) {
    setState(() {
      if (changetxt == 0) {
        Navigator.pushNamed(
            context, TransactionListScreen.transactionListScreen);
      }
    });
  }

  // create a TextEditingController
  final _controller = TextEditingController();

  // dispose it when the widget is unmounted
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _validate = false;
  bool _validateIntitule = false;
  bool _validateAccount = false;
  bool _validateCodeReception = false;
  bool _validateName = false;
  bool _validatePhone = false;
  bool _validateAmount = false;

  @override
  Widget build(BuildContext context) {
    final int? arguments = ModalRoute.of(context)?.settings.arguments as int?;
    if (arguments != null) {
      currentStep = arguments;
    }

    return Scaffold(
      /*appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),*/
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.deepOrange),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(left: 20, top: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: buildIconButton(
                            iconColor: Color.fromRGBO(17, 16, 15, 1),
                            iconButton: Icons.arrow_back_ios,
                            buttonText: '',
                            fontSizeIcon: 35,
                            callBackFunction: funcBack),
                      ),
                      Container(
//margin: EdgeInsets.only(bottom:640),
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
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                      margin: EdgeInsets.only(top: 35),
                      child: Stepper(
                        steps: getSteps(),
                        currentStep: currentStep,
                        type: StepperType.horizontal,
                        onStepContinue: () {
                          final isLastStep =
                              currentStep == getSteps().length - 1;

                          if (isLastStep) {
                          } else {
                            if (currentStep == 1) {
                              if (_selectedGender == 'manuel') {
                                if (NameReceiver.text.isEmpty) {
                                  setState(() {
                                    _validateName = true;
                                  });
                                } else {
                                  setState(() {
                                    _validateName = false;
                                  });
                                }
                                if (PhoneNumber.text.isEmpty) {
                                  setState(() {
                                    _validatePhone = true;
                                  });
                                } else {
                                  setState(() {
                                    _validatePhone = false;
                                  });
                                }

                                if (NameReceiver.text.isNotEmpty &&
                                    NameReceiver.text.isNotEmpty &&
                                    receptionCode.text.isNotEmpty) {
                                  setState(() {
                                    currentStep += 1;
                                  });
                                }
                              }
                            }

                            if (currentStep == 1) {
                              if (_selectedGender == 'bancaire') {
                                if (NameBank.text.isEmpty) {
                                  setState(() {
                                    _validate = true;
                                  });
                                } else {
                                  setState(() {
                                    _validate = false;
                                  });
                                }
                                if (IntituleBank.text.isEmpty) {
                                  setState(() {
                                    _validateIntitule = true;
                                  });
                                } else {
                                  setState(() {
                                    _validateIntitule = false;
                                  });
                                }
                                if (numberAccount.text.isEmpty) {
                                  setState(() {
                                    _validateAccount = true;
                                  });
                                } else {
                                  setState(() {
                                    _validateAccount = false;
                                  });
                                }
                                if (receptionCode.text.isEmpty) {
                                  setState(() {
                                    _validateCodeReception = true;
                                  });
                                } else {
                                  setState(() {
                                    _validateCodeReception = false;
                                  });
                                }

                                if (NameBank.text.isNotEmpty &&
                                    IntituleBank.text.isNotEmpty &&
                                    numberAccount.text.isNotEmpty &&
                                    receptionCode.text.isNotEmpty) {
                                  setState(() {
                                    currentStep += 1;
                                  });
                                }
                              }
                            }

                            if (currentStep == 0) {
                              if (selectedCountryReceiver == null ||
                                  selectedCityReceiver == null) {
                                setState(() {
                                  displayError = true;
                                });
                              } else {
                                setState(() {
                                  currentStep += 1;
                                  displayError = false;
                                });
                              }
                            }
                          }
                        },
                        onStepCancel: () {
                          currentStep == 0
                              ? null
                              : setState(() {
                                  currentStep -= 1;
                                });
                        },
                        controlsBuilder:
                            (BuildContext context, ControlsDetails details) {
                          final isLastStep =
                              currentStep == getSteps().length - 1;
                          return Container(
                            margin: EdgeInsets.only(
                                top:
                                    15), // modifie la position des elevated button
                            child: Row(
                              children: [
                                if (currentStep == 0) ...[
                                  Expanded(
                                      child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: details.onStepContinue,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text('Suivant'), // <-- Text
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
// <-- Icon
                                            Icons.arrow_forward_ios,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                ] else if (currentStep > 0 &&
                                    currentStep == 1) ...[
                                  Expanded(
                                      child: ElevatedButton(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Icon(
                                          // <-- Icon
                                          Icons.arrow_back_ios_new,
                                          size: 24.0,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Précédent'),
                                      ],
                                    ),
                                    onPressed: details.onStepCancel,
                                  )),
                                  const SizedBox(width: 12),
                                  Expanded(
                                      child: ElevatedButton(
                                    onPressed: details.onStepContinue,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const [
                                        Text('Suivant'), // <-- Text
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
// <-- Ico
                                          Icons.arrow_forward_ios,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  )),
                                ] else if (currentStep > 0 &&
                                    currentStep == 2) ...[
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .deepOrange, // background (button) color
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text('Annuler'),
                                        ],
                                      ),
                                      onPressed: () {
                                        _showAlertDialog('annuler');
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors
                                            .deepOrange, // background (button) color
                                      ),
                                      onPressed: () async {
                                        if (_selectedGender == 'manuel') {
                                          MA_Helper_Manual manual =
                                              MA_Helper_Manual(
                                                  NameReceiver.text,
                                                  PhoneNumber.text);
                                          //manual.phoneNumber = "655198362";
                                          //manual.Name = "Evariste";
                                          MA_Helper_Transfert data =
                                              MA_Helper_Transfert(
                                                  amountController.hashCode,
                                                  selectedCitySender?.code,
                                                  selectedCityReceiver?.code,
                                                  receptionCode.text,
                                                  null,
                                                  manual as MA_Helper_Manual);
                                          /*data.Amount =1000;
                                          data.SenderCity ='douala';
                                          data.ReceiverCity ='Paris';
                                          data.ReceptionCode ='15Ptre';
                                          data.ManualInfo =manual;*/

                                          String response = await dataController
                                              .createTransfert(data);
                                          print('@@@@@' + response);
                                          if (response != null) {
                                            _showAlertDialog('confirm');
                                          }
                                        } else if (_selectedGender ==
                                            'bancaire') {
                                          MA_Helper_Bank bank = MA_Helper_Bank(
                                              NameBank.text, IntituleBank.text);
                                          //bank.Intitule = "Evariste";
                                          //bank.Name = "UBA";
                                          MA_Helper_Transfert data =
                                              MA_Helper_Transfert(
                                                  amountController.hashCode,
                                                  selectedCitySender?.code,
                                                  selectedCityReceiver?.code,
                                                  receptionCode.text,
                                                  bank as MA_Helper_Bank,
                                                  null);
                                          /*data.Amount =1000;
                                          data.SenderCity ='douala';
                                          data.ReceiverCity ='Paris';
                                          data.ReceptionCode ='15Ptre';
                                          data.BankInfo =bank;*/

                                          String response = await dataController
                                              .createTransfert(data);
                                          print('@@@@@' + response);
                                          if (response != null) {
                                            _showAlertDialog('confirm');
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Text('Confirmer'), // <-- Text
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              ],
                            ),
                          ); //* gestion de sboutons du bas//
                        },
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          getFooter(callBackFunction: funChange, currentIndex: 1),
    );
  }

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 0,
            title: Text('Etape 1'),
            content: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
              height: 400,
              width: 600,
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
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 33,
                    top: 25,
                    child: Container(
                        child: Column(
                      children: [
                        Text('Information sur les Transactions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        if (displayError)
                          Text(
                              'Veillez Selectionner Le pays \n et la Ville du Recepteur !!!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.red)),
                      ],
                    )),
                  ),
                  Positioned(
                    left: 15,
                    top: 80,
                    width: 290,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: Colors.grey,
                            //width: 4.0,
                            style: BorderStyle.solid),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: SvgPicture.asset(
                              'assets/Vector.svg',
                              placeholderBuilder: (context) =>
                                  CircularProgressIndicator(),
                              height: 30.0,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                                  child: Text('Envoi de',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF6F6F6F)))),
                              DropdownSender()
                              /*DropMenuApp()*/
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                                    child: Text('Ville',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Color(0xFF6F6F6F)))),
                                DropdownSenderCity(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 190,
                    width: 290,
                    height: 80,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: Colors.grey,
                            //width: 4.0,
                            style: BorderStyle.solid),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: SvgPicture.asset(
                              'assets/game-icons_receive-money.svg',
                              placeholderBuilder: (context) =>
                                  CircularProgressIndicator(),
                              height: 30.0,
                              width: 30,
                            ),
                          ),
                          SizedBox(width: 7),
                          Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 90, 0),
                                  child: Text('Vers',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF6F6F6F)))),
                              DropdownReceiver(),
                            ],
                          ),
                          // DropdownReceiver(),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                                    child: Text('Ville',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Color(0xFF6F6F6F)))),
                                DropdownReceiverCity(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 300,
                    width: 260,
                    height: 50,
                    child: Container(
                        child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text('Montant :',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF6F6F6F))),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: SizedBox(
                            width: 165,
                            height: 40,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: amountController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Entrer un  montant',
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  Positioned(
                    top: 150,
                    left: 240,
                    child: /*Image.asset('assets/arrow.jpeg')*/
                        SvgPicture.asset(
                      'assets/gg_arrows-exchange-alt-v.svg',
                      // placeholderBuilder: (context) => const CircularProgressIndicator(),
                      height: 50.0,
                      width: 30,
                      // fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ) // 1er Padding
            ),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: Text('Etape 2'),
            content: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 435,
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
                          child: Text('Mode de Reception',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13))),
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: Colors.deepOrange,
                            value: 'manuel',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                          ),
                          const Text('Manuel'),
                          Radio<String>(
                            activeColor: Colors.deepOrange,
                            value: 'bancaire',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                          ),
                          Text('Bancaire'),
                        ],
                      ),
                      const SizedBox(height: 5),
                      if (_selectedGender == 'manuel') ...[
                        Container(
                          child: Column(
                            children: [
                              InputForm('Nom du destinataire', 'NameSender'),
                              SizedBox(height: 20),
                              InputForm('N° Téléphone', 'PhoneNumber'),
                              SizedBox(height: 20),
                              // DropDownForm('Pays','Pays'),
                              // DropDownForm('Ville','Ville'),
                              InputForm('Code de reception', 'CodeReception'),
                              SizedBox(height: 30),
                              Text(
                                  'NB: le code de réception est à transmettre uniquement à votre récépteur.',
                                  style: TextStyle(color: Color(0xFF6F6F6F))),
                            ],
                          ),
                        )
                      ] else
                        Container(
                          child: Column(
                            children: [
                              InputForm('Nom de la Banque', 'NameBank'),
                              SizedBox(height: 5),
                              InputForm('intitulé du compte', 'IntituleBank'),
                              SizedBox(height: 5),
                              InputForm('N° Compte', 'AccountNumber'),
                              SizedBox(height: 5),
                              InputForm('Code de reception', 'CodeReception'),
                              SizedBox(height: 10),
                              Text(
                                  'NB: le code de réception est à transmettre uniquement à votre récépteur.',
                                  style: TextStyle(color: Color(0xFF6F6F6F))),
                            ],
                          ),
                        )
                    ],
                  )),
            ) // 1er Padding
            ),
        Step(
            isActive: currentStep >= 2,
            title: Text('Etape 3'),
            content: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              height: 465,
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
              child: Scrollbar(
                controller: _controllerOne,
                thumbVisibility: true, //always show scrollbar
                thickness: 10, //width of scrollbar
                radius: Radius.circular(20), //corner radius of scrollbar
                scrollbarOrientation:
                    ScrollbarOrientation.right, //which side to show scrollbar
                child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: ListView(
                      controller: _controllerOne,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                                child: Text(
                                    'Vérifier les informations sur la transaction',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13))),
                            const SizedBox(height: 5),
                            if (_selectedGender == 'manuel') ...[
                              Container(
                                child: Column(
                                  children: [
                                    fieldInput(
                                        topText: 'Pays envoi',
                                        bottomText: dropdownvalueSender,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 0),
                                    fieldInput(
                                        topText: 'Pays de reception',
                                        bottomText: dropdownvalueReceiver,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 0),
                                    fieldInput(
                                        topText: 'Montant',
                                        bottomText: amountController.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 0),
                                    fieldInput(
                                        topText: 'Nom du destinataire',
                                        bottomText: NameReceiver.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 0),
                                    fieldInput(
                                        topText:
                                            'Pays et ville du destinataire',
                                        bottomText:
                                            dropdownvalueCountryReception +
                                                ',' +
                                                dropdownvalueCountryReception,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 0),
                                    fieldInput(
                                        topText: 'N°Telephone',
                                        bottomText: PhoneNumber.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 0),
                                    fieldInput(
                                        topText: 'Code de Réception',
                                        bottomText: receptionCode.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 0),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                          'NB: le code de réception est à transmettre uniquement à votre récépteur.',
                                          style: TextStyle(
                                              color: Color(0xFF6F6F6F))),
                                    ),
                                  ],
                                ),
                              )
                            ] else if (_selectedGender == 'bancaire') ...[
                              Container(
                                child: Column(
                                  children: [
                                    fieldInput(
                                        topText: 'Pays envoi',
                                        bottomText: dropdownvalueSender,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 0),
                                    fieldInput(
                                        topText: 'Pays de reception',
                                        bottomText: dropdownvalueReceiver,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 0),
                                    fieldInput(
                                        topText: 'Montant',
                                        bottomText: amountController.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 0),
                                    fieldInput(
                                        topText: 'Nom de la Banque',
                                        bottomText: NameBank.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 1),
                                    fieldInput(
                                        topText: 'intitulé du ',
                                        bottomText: IntituleBank.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 1),
                                    fieldInput(
                                        topText: 'N°Compte',
                                        bottomText: numberAccount.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 1),
                                    fieldInput(
                                        topText: 'Code de Réception',
                                        bottomText: receptionCode.text,
                                        svgLink:
                                            'assets/material-symbols_edit.svg',
                                        step: 1,
                                        radioStep: 1),
                                    SizedBox(width: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                          'NB: le code de réception est à transmettre uniquement à votre récépteur.',
                                          style: TextStyle(
                                              color: Color(0xFF6F6F6F))),
                                    ),
                                  ],
                                ),
                              )
                            ]
                          ],
                        )
                      ],
                    )),
              ),
            ))
      ];

//widgets permettant d'afficher la pop up

  Future<void> _showAlertDialog(String? Type) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        if (Type == 'confirm') {
          return AlertDialog(
            // <-- SEE HERE
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 10, color: Colors.deepOrange),
                      color: Colors.deepOrange,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.done_outlined,
                        color: Colors.white, size: 15)),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    "Votre demande de transaction a été bien enregistée. vous recevrez une notification d'ici peu",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(width: 1, color: Colors.deepOrange),
                      color: Colors.deepOrange,
                    ),
                    child: TextButton(
                      child: const Text(
                        'ok',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionListScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return AlertDialog(
            // <-- SEE HERE
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/trash.svg',
                  // placeholderBuilder: (context) => const CircularProgressIndicator(),
                  height: 33.0,
                  width: 38,
                  // fit: BoxFit.cover,
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    "Annuler la transaction ?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " Cette action sera irreversible",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Colors.grey,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Non',
                            style: TextStyle(
                              color: Color(0xFF6F6F6F),
                            )),
                      )),
                  SizedBox(width: 30),
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(width: 1, color: Colors.deepOrange),
                      color: Colors.deepOrange,
                    ),
                    child: TextButton(
                      child: const Text(
                        'Oui',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransactionListScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }

// widgets permettant d'afficher l'icone  ci < dans < transaction d'argent
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

  Widget fieldInput({
    //material-symbols_edit
    required String topText,
    required String bottomText,
    required String svgLink,
    required int step,
    int? radioStep,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
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
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (step == 0) {
                    currentStep = 0;
                  } else if (step == 1 && radioStep == 0) {
                    currentStep = 1;
                    _selectedGender = 'manuel';
                  } else if (step == 1 && radioStep == 1) {
                    currentStep = 1;
                    _selectedGender = 'bancaire';
                  }
                });
              },
              child: SvgPicture.asset(svgLink,
                  width: 15,
                  // ignore: deprecated_member_use
                  color: Color.fromRGBO(246, 60, 3, 1)),
            ),
          ),
        ],
      ),
    );
  }

  Container InputForm(String label, String codeInput
      /*,TextEditingController? controller,Function? validator*/
      ) {
    var _text = '';
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 130, 0),
          child: Text(label, style: TextStyle(color: Color(0xFF6F6F6F))),
        ),
        SizedBox(
          height: 7,
        ),
        if (codeInput == 'NameBank') ...[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: TextField(
                //textDirection: TextDirection.ltr ,
                keyboardType: TextInputType.text,
                cursorColor: Colors.orange,
                controller: NameBank,
                decoration: InputDecoration(
                  errorText: _validate
                      ? 'veillez renseigner le Nom de la Banque'
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF6F6F6F)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ] else if (codeInput == 'IntituleBank') ...[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.orange,
                controller: IntituleBank,
                decoration: InputDecoration(
                  errorText: _validateIntitule
                      ? 'veillez renseigner l\'Intitule du compte'
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF6F6F6F)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ] else if (codeInput == 'AccountNumber') ...[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.orange,
                controller: numberAccount,
                decoration: InputDecoration(
                  errorText: _validateAccount
                      ? 'veillez renseigner le Numero de Compte'
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF6F6F6F)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ] else if (codeInput == 'CodeReception') ...[
          //NameSender
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: TextField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.orange,
                controller: receptionCode,
                decoration: InputDecoration(
                  errorText: _validateCodeReception
                      ? 'veillez renseigner le Code Reception'
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF6F6F6F)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ] else if (codeInput == 'NameSender') ...[
          //PhoneNumber
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.orange,
                controller: NameReceiver,
                decoration: InputDecoration(
                  errorText: _validateName
                      ? 'veillez renseigner le Nom du Destinataire'
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF6F6F6F)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ] else if (codeInput == 'PhoneNumber') ...[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.orange,
                controller: PhoneNumber,
                decoration: InputDecoration(
                  errorText: _validatePhone
                      ? 'veillez renseigner le Numero de Telephone'
                      : null,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: Color(0xFF6F6F6F)), //<-- SEE HERE
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          )
        ]
      ]),
    );
  }

/////////// sender Country
  Widget DropdownSender() {
    return DropdownButton(
      // Initial Value
      value: selectedCountrySender,

      // Down Arrow Icon
      icon: const Icon(
        Icons.arrow_drop_down,
        color: const Color(0XFFF24E1E),
      ),

      // Array list of items
      items: countryList
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e,
              ))
          .toSet()
          .toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (val) {
        setState(() {
          selectedCitySender = null;
          print(selectedCitySender);
          cityListSender.clear();
          print("****cityList just after the clear****");
          print(cityListSender);
          selectedCountrySender = val as MA_Helper_Country;
          cityListSender = val?.cities.toSet().toList() as List<MA_Helper_City>;
          print("****cityList after the set up****");
          print(cityListSender);
        });
      },
    );
  }

/////////// Receiver Country
  Widget DropdownReceiver() {
    return DropdownButton(
      // Initial Value
      value: selectedCountryReceiver,

      // Down Arrow Icon
      icon: const Icon(
        Icons.arrow_drop_down,
        color: const Color(0XFFF24E1E),
      ),

      // Array list of items
      items: countryList
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e,
              ))
          .toSet()
          .toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (val) {
        setState(() {
          selectedCityReceiver = null;
          print(selectedCityReceiver);
          cityListReceiver.clear();
          print("****cityList just after the clear****");
          print(cityListReceiver);
          selectedCountryReceiver = val as MA_Helper_Country;
          cityListReceiver =
              val?.cities.toSet().toList() as List<MA_Helper_City>;
          print("****cityList after the set up****");
          print(cityListSender);
        });
      },
    );
  }

  Widget DropdownSenderCity() {
    return DropdownButton(
      // Initial Value
      value: selectedCitySender,
      // Down Arrow Icon
      icon: const Icon(
        Icons.arrow_drop_down,
        color: const Color(0XFFF24E1E),
      ),

      // Array list of items
      items: cityListSender
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e,
              ))
          .toSet()
          .toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (val) {
        setState(() {
          selectedCitySender = val as MA_Helper_City;
          //cityList.clear();
        });
      },
    );
  }

  Widget DropdownReceiverCity() {
    return DropdownButton(
      // Initial Value
      value: selectedCityReceiver,
      // Down Arrow Icon
      icon: const Icon(
        Icons.arrow_drop_down,
        color: const Color(0XFFF24E1E),
      ),
      // Array list of items
      items: cityListReceiver
          .map((e) => DropdownMenuItem(
                child: Text(e.name),
                value: e,
              ))
          .toSet()
          .toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (val) {
        setState(() {
          selectedCityReceiver = val as MA_Helper_City;
          //cityList.clear();
        });
      },
    );
  }

  Container DropDownForm(String label, String code) {
    String? dropdownValue = 'Cameroun';
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 130, 0),
            child: Text(label, style: TextStyle(color: Color(0xFF6F6F6F))),
          ),
          if (code == 'Pays') ...[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: SizedBox(height: 30, child: DropdownSender()),
            )
          ] else if (code == 'Ville') ...[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: SizedBox(height: 30, child: DropdownSenderCity()
                  /* DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(//<-- SEE HERE
                    // borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                /*focusedBorder: OutlineInputBorder( //<-- SEE HERE
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),*/
                //filled: true,
                //fillColor: Colors.greenAccent,
              ),
              dropdownColor: Colors.greenAccent,
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState() {
                  dropdownValue = newValue;
                }
              },
              items: <String>[
                'USA',
                'Cameroun',
                'France',
                'Allemagne',
                'Gabon',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
            ),*/
                  ),
            )
          ]
        ],
      ),
    );
  }
//navigationBar
}

/*  contentPadding: EdgeInsets.only(top: 10,left: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(width: 2, color: Color(0xFF6F6F6F)),
                      ),*/


