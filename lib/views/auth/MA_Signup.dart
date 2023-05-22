import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/utils/MA_Styles.dart';

import '../../utils/MA_Widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Image.asset('assets/logo.png'),
            SizedBox(
              height: Get.height * 0.02,
            ),
            myText(
              text: 'Inscription',
              style: GoogleFonts.dmSans(
                  textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
              ),
              textAlign: TextAlign.center
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            myTextField(
                bool: false,
                icon: 'assets/icon_name.png',
                text: 'Nom',
                validator: (String input){
                  if(input.isEmpty){
                    Get.snackbar('Warning', 'Le Nom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                    return '';
                  }

                },
                controller: nomController
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            myTextField(
                bool: false,
                icon: 'assets/icon_name.png',
                text: 'Prenom',
                validator: (String input){
                  if(input.isEmpty){
                    Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                    return '';
                  }

                },
                controller: prenomController
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            myTextField(
                bool: false,
                icon: 'assets/mail.png',
                text: 'Email',
                validator: (String input){
                  if(input.isEmpty){
                    Get.snackbar('Warning', 'Email is required.',colorText: Colors.white,backgroundColor: Colors.blue);
                    return '';
                  }

                  if(!input.contains('@')){
                    Get.snackbar('Warning', 'Email is invalid.',colorText: Colors.white,backgroundColor: Colors.blue);
                    return '';
                  }
                },
                controller: emailController
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            myTextField(
                bool: false,
                icon: 'assets/flag.png',
                text: 'Pays',
                validator: (String input){
                  if(input.isEmpty){
                    Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                    return '';
                  }

                },
                controller: prenomController
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            myTextField(
                bool: false,
                icon: 'assets/ville.png',
                text: 'Ville',
                validator: (String input){
                  if(input.isEmpty){
                    Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                    return '';
                  }

                },
                controller: prenomController
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                elevatedButton(
                    text: 'Annuler',
                    onpress: (){

                    },
                  width: 130.0,
                  height: 40.0,
                ),
                elevatedButton(
                    text: 'Suivant',
                    onpress: (){
                    },
                  width: 130.0,
                  height: 40.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
