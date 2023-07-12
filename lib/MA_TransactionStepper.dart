import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_app/utils/MA_Widgets.dart';
import 'package:money_app/views/MA_RecapInformation.dart';

class transfertForm extends StatefulWidget {
  const transfertForm({Key? key}) : super(key: key);

  @override
  State<transfertForm> createState() => _transfertFormState();
}

class _transfertFormState extends State<transfertForm> {
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

  // List of items in our dropdown menu
  var items = [
    'USA',
    'Cameroun',
    'France',
    'Allemagne',
    'Gabon',
  ];

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




  void funChange (){

  }
  @override
  Widget build(BuildContext context) {
    final int? arguments = ModalRoute.of(context)?.settings.arguments as int?;
    if(arguments !=null){
      currentStep = arguments;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.deepOrange),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
              child: Stepper(
            steps: getSteps(),
            currentStep: currentStep,
            type: StepperType.horizontal,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;

              if (isLastStep) {
                if(_selectedGender == 'manuel'){
                  setState(() {
                    displayManualRecap = true;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionInfo(
                          selectedGender: _selectedGender,
                          CountrySender:dropdownvalueSender,
                          CountryReceiver:dropdownvalueReceiver,
                          amountController:amountController.text,
                          NameBank:NameBank.text,
                          IntituleBank:IntituleBank.text,
                          numberAccount:numberAccount.text,
                          receptionCode:receptionCode.text,
                          NameReceiver:NameReceiver.text,
                          PhoneNumber:PhoneNumber.text,
                          CountryReception:dropdownvalueCountryReception,
                          CityReception:dropdownvalueCityReception,
                          currentStep : currentStep
                      ),
                    ),
                  );
                }else if(_selectedGender == 'bancaire'){
                  setState(() {
                    displayBankRecap = true;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionInfo(
                        selectedGender: _selectedGender,
                        CountrySender:dropdownvalueSender,
                        CountryReceiver:dropdownvalueReceiver,
                        amountController:amountController.text,
                        NameBank:NameBank.text,
                        IntituleBank:IntituleBank.text,
                        numberAccount:numberAccount.text,
                        receptionCode:receptionCode.text,
                        NameReceiver:NameReceiver.text,
                        PhoneNumber:PhoneNumber.text,
                        CountryReception:dropdownvalueCountryReception,
                        CityReception:dropdownvalueCityReception,
                          currentStep : currentStep
                      ),
                    ),
                  );
                }
                print('Completed');
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    });
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              final isLastStep = currentStep == getSteps().length - 1;
              return Container(
                margin: EdgeInsets.only(top:15),// modifie la position des elevated button
                child: Row(
                  children: [
                    if (currentStep == 0) ...[
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
                              // <-- Icon
                              Icons.arrow_forward_ios,
                              size: 24.0,
                            ),
                          ],
                        ),
                      )),
                    ] else if (currentStep > 0 && currentStep == 1) ...[
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
                              // <-- Icon
                              Icons.arrow_forward_ios,
                              size: 24.0,
                            ),
                          ],
                        ),
                      )),
                    ]
                  ],
                ),
              ); //* gestion de sboutons du bas//
            },
          )),
        ),
      ),
      //bottomNavigationBar:getFooter(callBackFunction: funChange, currentIndex: 1),
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
                        child: Text('Information sur les Transactions',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13))),
                  ),
                  Positioned(
                    left: 15,
                    top: 80,
                    width: 250,
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
                          SizedBox(width: 20),
                          Column(
                            children:  [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                                  child: Text('Envoi de', style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF6F6F6F)))),
                               DropdownSender()
                              /*DropMenuApp()*/
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 190,
                    width: 250,
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
                          SizedBox(width: 20),
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
                      children:  [
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
                              controller: amountController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter a search term',
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  Positioned(
                    top: 150,
                    left: 200,
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
                          Radio<String>(activeColor: Colors.deepOrange,
                            value: 'manuel',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                          ),
                          const Text('Manuel'),
                          Radio<String>(activeColor: Colors.deepOrange,
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
                              InputForm('Nom du destinataire','NameSender'),
                              InputForm('N° Téléphone','PhoneNumber'),
                              DropDownForm('Pays','Pays'),
                              DropDownForm('Ville','Ville'),
                              InputForm('Code de reception','CodeReception'),
                              Text('NB: le code de réception est à transmettre uniquement à votre récépteur.', style: TextStyle(color: Color(0xFF6F6F6F))),
                            ],
                          ),
                        )
                      ] else
                        Container(
                          child: Column(
                            children: [
                              InputForm('Nom de la Banque','NameBank'),
                              InputForm('intitulé du compte','IntituleBank'),
                              InputForm('N° Compte','AccountNumber'),
                              InputForm('Code de reception','CodeReception'),
                              Text('NB: le code de réception est à transmettre uniquement à votre récépteur.', style: TextStyle(color: Color(0xFF6F6F6F))),
                            ],
                          ),
                        )
                    ],
                  )),
            ) // 1er Padding
            ),
       /* Step(
            isActive: currentStep >= 2,
            title: Text('Etape 3'),
            content: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height:495,
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
                                  fontWeight: FontWeight.bold, fontSize: 13))),
                      const SizedBox(height: 5),
                      if (_selectedGender == 'manuel') ...[
                        Container(
                          child: Column(
                            children: [
                              fieldInput(topText:'Pays envoi',bottomText:'USA',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Pays de reception',bottomText:'Cameroun',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Montant',bottomText:'470.00',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Nom du destinataire',bottomText:'Robert Boum',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Pays et ville du destinataire',bottomText:'Yaoundé, Cameroun',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'N°Telephone',bottomText:'+237689457150',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Code de Réception',bottomText:'Trans:062089',svgLink:'assets/material-symbols_edit.svg'),
                              SizedBox(width: 5),
                              Text('NB: le code de réception est à transmettre uniquement à votre récépteur.', style: TextStyle(color: Color(0xFF6F6F6F),fontSize: 10)),
                            ],
                          ),
                        )
                      ]else if (_selectedGender == 'bancaire') ...[
                        Container(
                          child: Column(
                            children: [
                              fieldInput(topText:'Pays envoi',bottomText:'USA',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Pays de reception',bottomText:'Cameroun',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Montant',bottomText:'470.00',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Nom de la Banque',bottomText:'UBA',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'intitulé du ',bottomText:'Yaoundé, Cameroun',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'N°Compte',bottomText:'012478635',svgLink:'assets/material-symbols_edit.svg'),
                              fieldInput(topText:'Code de Réception',bottomText:'Trans:062089',svgLink:'assets/material-symbols_edit.svg'),
                              SizedBox(width: 5),
                              Text('NB: le code de réception est à transmettre uniquement à votre récépteur.', style: TextStyle(color: Color(0xFF6F6F6F),fontSize: 10)),
                            ],
                          ),
                        )
                      ]
                    ],
                  )),
            )
        )*/
      ];

  Container InputForm(
    String label,String codeInput
    /*,TextEditingController? controller,Function? validator*/
  ) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 130, 0),
            child: Text(label, style: TextStyle(color: Color(0xFF6F6F6F))),
          ),
         if (codeInput == 'NameBank') ...[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: SizedBox(
              height: 30,
              child:
                  TextFormField(
                  cursorColor: Colors.orange,
                    controller: NameBank,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(width: 2, color: Color(0xFF6F6F6F)),
                    ),
                  ),
                ),

            ),
          )
          ]else if (codeInput == 'IntituleBank') ...[
           Padding(
             padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
             child: SizedBox(
               height: 30,
               child:

               TextFormField(
                 cursorColor: Colors.orange,
                 controller: IntituleBank,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top: 5),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0)),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                     borderSide: BorderSide(width: 2, color: Color(0xFF6F6F6F)),
                   ),
                 ),
               ),

             ),
           )
          ]else if (codeInput == 'AccountNumber') ...[
           Padding(
             padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
             child: SizedBox(
               height: 30,
               child:

               TextFormField(
                 cursorColor: Colors.orange,
                 controller: numberAccount,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top: 5),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0)),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                     borderSide: BorderSide(width: 2, color: Color(0xFF6F6F6F)),
                   ),
                 ),
               ),

             ),
           )
         ]else if (codeInput == 'CodeReception') ...[//NameSender
           Padding(
             padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
             child: SizedBox(
               height: 30,
               child:

               TextFormField(
                 cursorColor: Colors.orange,
                 controller: receptionCode,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top: 5),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0)),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                     borderSide: BorderSide(width: 2, color: Color(0xFF6F6F6F)),
                   ),
                 ),
               ),

             ),
           )
         ]else if (codeInput == 'NameSender') ...[//PhoneNumber
           Padding(
             padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
             child: SizedBox(
               height: 30,
               child:

               TextFormField(
                 cursorColor: Colors.orange,
                 controller: NameReceiver,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top: 5),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0)),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                     borderSide: BorderSide(width: 2, color: Color(0xFF6F6F6F)),
                   ),
                 ),
               ),

             ),
           )
         ]else if (codeInput == 'PhoneNumber') ...[
           Padding(
             padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
             child: SizedBox(
               height: 30,
               child:

               TextFormField(
                 cursorColor: Colors.orange,
                 controller: PhoneNumber,
                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.only(top: 5),
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0)),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0),
                     borderSide: BorderSide(width: 2, color: Color(0xFF6F6F6F)),
                   ),
                 ),
               ),

             ),
           )
         ]
        ]
      ),
    );
  }

  Widget DropdownSender() {
    return DropdownButton(
      // Initial Value
      value: dropdownvalueSender,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalueSender = newValue!;
        });
      },
    );
  }

  Widget DropdownReceiver() {
    return DropdownButton(
      // Initial Value
      value: dropdownvalueReceiver,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalueReceiver = newValue!;
        });
      },
    );
  }

  Widget DropdownReceiverCountry() {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF6F6F6F),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton(
              // Initial Value
              value: dropdownvalueCountryReception,
              // Down Arrow Icon
              isExpanded: true, //make true to take width of parent widget
              underline: Container(), //empty line
              style: TextStyle(fontSize: 18, color: Colors.black),
              dropdownColor: Colors.green,
              iconEnabledColor: Colors.deepOrange, //Icon color
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalueCountryReception = newValue!;
                });
              },
            )));
  }

  Widget DropdownReceiverCity() {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF6F6F6F),
            style: BorderStyle.solid,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton(
              // Initial Value
              value: dropdownvalueCityReception,
              // Down Arrow Icon
              isExpanded: true, //make true to take width of parent widget
              underline: Container(), //empty line
              style: TextStyle(fontSize: 18, color: Colors.black),
              dropdownColor: Colors.green,
              iconEnabledColor: Colors.deepOrange, //Icon color
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalueCityReception = newValue!;
                });
              },
            )));
  }
  Container DropDownForm(String label,String code) {
    String? dropdownValue = 'Cameroun';
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 2, 130, 0),
            child: Text(label, style: TextStyle(color: Color(0xFF6F6F6F))),
          ),
          if(code=='Pays') ...[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: SizedBox(
                  height: 30,
                  child: DropdownReceiverCountry()
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
          ]else if(code=='Ville') ...[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: SizedBox(
                  height: 30,
                  child: DropdownReceiverCity()
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

class DropMenuApp extends StatefulWidget {
  const DropMenuApp({Key? key}) : super(key: key);

  @override
  State<DropMenuApp> createState() => _DropMenuAppState();
}

class _DropMenuAppState extends State<DropMenuApp> {
  // Initial Selected Value
  String dropdownvalue = 'USA';

  // List of items in our dropdown menu
  var items = [
    'USA',
    'Cameroun',
    'France',
    'Allemagne',
    'Gabon',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}

class DropDownwithOutline extends StatefulWidget {
  const DropDownwithOutline({Key? key}) : super(key: key);

  @override
  State<DropDownwithOutline> createState() => _DropDownwithOutlineState();
}

class _DropDownwithOutlineState extends State<DropDownwithOutline> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF6F6F6F),
            style: BorderStyle.solid,
            width: 1.0,
          ),
            borderRadius: BorderRadius.circular(5),
            ),
        child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton(
              value: "menuone",
              items: [
                DropdownMenuItem(
                  child: Text("Menu One"),
                  value: "menuone",
                )
              ],
              onChanged: (value) {},
              isExpanded: true, //make true to take width of parent widget
              underline: Container(), //empty line
              style: TextStyle(fontSize: 18, color: Colors.black),
              dropdownColor: Colors.green,
              iconEnabledColor: Colors.deepOrange, //Icon color
            )));
  }
}

