import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/MA_Styles.dart';
import '../../utils/MA_Widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset('assets/logo.png'),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                myText(
                    text: 'Connexion',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
                    ),
                    textAlign: TextAlign.center
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                SizedBox(
                  height: 75,
                  child: myTextField(
                      bool: false,
                      icon: 'assets/mail.png',
                      text: 'Email',
                      validator: (String input){
                        if(input.isEmpty){
                         // Get.snackbar('Warning', 'Le Mot de passe est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                          return 'Entrer votre Email';
                        }
                      },
                   //   controller: emailController
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                SizedBox(
                  height: 75,
                  child: myTextField(
                      bool: false,
                      icon: 'assets/icon_name.png',
                      text: 'Mot de Passe',
                      validator: (String input){
                        if(input.isEmpty){
                         // Get.snackbar('Warning', 'Le Mot de passe est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                          return 'Entrer votre mot de passe';
                        }

                      },
                   //   controller: prenomController
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                myText(
                    text: 'Mot de passe oublié?',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: AppColors.blueText)
                    ),
                    textAlign: TextAlign.right
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: elevatedButton(
                    text: 'Connexion',
                    onpress: (){
                      if(!formKey.currentState!.validate()){
                        return;
                      }
                    },
                    width: 30.0,
                    height: 40.0,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialAppsIcons(
                        text: 'assets/fb.png',
                        onPressed: (){

                        //  Get.to(()=> ProfileScreen());

                        }
                    ),

                    socialAppsIcons(
                        text: 'assets/google.png',
                        onPressed: (){

                      //    authController.signInWithGoogle();

                        }

                    ),
                  ],
                ),
                myText(
                    text: 'Vous n\'avez pas encore de compte?',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    textAlign: TextAlign.center
                ),
                textButton(
                    text: 'Creer un compte',
                    fontSize: 20.0,
                    color: AppColors.orange
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
