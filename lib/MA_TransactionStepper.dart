import 'package:flutter/material.dart';

class transfertForm extends StatefulWidget {
  const transfertForm({Key? key}) : super(key: key);

  @override
  State<transfertForm> createState() => _transfertFormState();
}

class _transfertFormState extends State<transfertForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
    );
  }
}
