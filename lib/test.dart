import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  int currentStep = 0;

  final  firstName = TextEditingController();
  final  LastName = TextEditingController();
  final  Adress = TextEditingController();
  final  Postcode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Stepper Widgets'),
        centerTitle: true,
      ),
      body:Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary:Colors.deepOrange),
          ),
        child: Stepper(
          controlsBuilder: (BuildContext context,ControlsDetails details){
            final isLastStep  = currentStep == getSteps().length - 1;
            return Container(
              margin: EdgeInsets.only(top:50),
              child: Row(
                children: [
                  Expanded(child: ElevatedButton(
                    child: Text(isLastStep? 'Confirmer':'Next'),
                    onPressed: details.onStepContinue,
                  )),
                   const SizedBox(width:12),
                  if(currentStep != 0)
                  Expanded(child: ElevatedButton(
                    child: Text('Cancel'),
                    onPressed: details.onStepCancel,
                  )),
                ],
              ),
            );//* gestion de sboutons du bas//
          },
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: (){
            final isLastStep  = currentStep == getSteps().length - 1;

            if(isLastStep){
              print('Completed');
            }else{
              setState(() {
                currentStep +=1;
              });
            }
          },
          onStepCancel: (){
            currentStep ==0 ? null : setState(() {currentStep -=1;});
          },

        ),
      ),
    );

  }

  List<Step> getSteps() =>[
    Step(
        state: currentStep >0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >=0,
        title: Text('Account'),
        content: Column(
          children: [
            TextFormField(

              controller: firstName,
              decoration: InputDecoration(labelText: 'First name'),
            ),
            TextFormField(
              controller: LastName,
              decoration: InputDecoration(labelText: 'Last Name'),
            )
          ],
        )
    ),
    Step(
        state: currentStep >1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >=1,
        title: Text('Address'),
        content:Column(
          children: [
            TextFormField(
              controller: Adress,
              decoration: InputDecoration(labelText: 'Adress'),
            ),
            TextFormField(
              controller: Postcode,
              decoration: InputDecoration(labelText: 'Post Code'),
            )
          ],
        )
    ),
    Step(
        isActive: currentStep >=2,
        title: Text('Complete'),
        content: Container()
    )
  ];
}
