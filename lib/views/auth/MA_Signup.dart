import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/utils/MA_Styles.dart';

import '../../utils/MA_Widgets.dart';
import 'MA_Login.dart';
import 'MA_Signup2.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController paysController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  bool _isShow1 = true;
  bool _isShow2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, top: 15),
          child: Column(
              children: [
                Image.asset('assets/logo.png'),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                myText(
                  text: 'Inscription',
                  style: GoogleFonts.dmSans(
                      textStyle: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
                  ),
                  textAlign: TextAlign.center
                ),
                Container(
                  child: Form(
                    key:formKey,
                    child: Column(
                      children: [
                        Visibility(
                            visible: _isShow1,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                SizedBox(
                                  height: 75,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/icon_name.png',
                                      text: 'Nom',
                                      validator: (String input){
                                        if(input.isEmpty ){
                                          //  Get.snackbar('Warning', 'Le Nom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          //  texterror: 'veillez entrez votre Nom';
                                          return 'veillez entrez votre Nom';
                                        }

                                      },
                                      controller: nomController
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
                                      text: 'Prenom',
                                      validator: (String input){
                                        if(input.isEmpty ){
                                          //  Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          return 'veillez entrez votre Nom';
                                        }

                                      },
                                      controller: prenomController
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                SizedBox(
                                  height: 75,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/mail.png',
                                      text: 'Email',
                                      validator: (String input){

                                      },
                                      controller: emailController
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                SizedBox(
                                  height: 75,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/flag.png',
                                      text: 'Pays',
                                      validator: (String input){
                                        if(input.isEmpty){
                                          // Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          return 'Veillez renseigner le pays';
                                        }

                                      },
                                      controller: paysController
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                SizedBox(
                                  height: 75,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/ville.png',
                                      text: 'Ville',
                                      validator: (String input){
                                        if(input.isEmpty){
                                          //   Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          return 'Veillez renseigner la ville';
                                        }

                                      },
                                      controller: villeController
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
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
                                    elevatedButtonright(
                                        text: 'Suivant',
                                        onpress: (){
                                          if(!formKey.currentState!.validate()){
                                            return;
                                          }
                                         // Get.to(()=>LoginView2());
                                          setState(() {
                                            _isShow1 = false;
                                            _isShow2 = true;
                                          });

                                        },
                                        width: 130.0,
                                        height: 40.0,
                                        icon: Icon(
                                            Icons.chevron_right_outlined
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),
                        Visibility(
                            visible: _isShow2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                SizedBox(
                                  height: 75,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/phone_icon.png',
                                      text: 'Telephone',
                                      validator: (String input){
                                        if(input.isEmpty){
                                          //   Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          return 'Veillez renseigner votre numero de Telephone';
                                        }

                                      },
                                      controller: telephoneController
                                  ),
                                ),
                                SizedBox(
                                  height: 75,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/icon_name.png',
                                      text: 'Nom d\'utilisateur',
                                      validator: (String input){
                                        if(input.isEmpty){
                                          //   Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          return 'Veillez entrer un nom d\'utilisateur';
                                        }

                                      },
                                      controller: userController
                                  ),
                                ),
                                SizedBox(
                                  height: 72,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/pass_icon.png',
                                      text: 'Mot de passe',
                                      validator: (String input){
                                        if(input.isEmpty){
                                          //   Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          return 'Veillez entrer un mot de passe';
                                        }

                                      },
                                      controller: passwordController
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                SizedBox(
                                  height: 65,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/pass_icon.png',
                                      text: 'Confirmez votre mot de passe',
                                      validator: (String input){
                                        if(input.isEmpty){
                                          //   Get.snackbar('Warning', 'Le Prenom est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
                                          return 'Veillez entrer un mot de passe';
                                        }

                                      },
                                      controller: confirmPassController
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                Card(),
                                SizedBox(
                                  width: 400,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      myText(
                                          text: 'Telecharger une pièce d\'identité \n ( CNI ou Passport)',
                                          style: GoogleFonts.dmSans(
                                              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
                                          ),
                                          textAlign: TextAlign.center
                                      ),
                                      IconButton(
                                        icon:  Icon(
                                          Icons.cloud_upload_outlined,
                                          size: 50,
                                        ),
                                        color: AppColors.orange,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    elevatedButtonright(
                                        text: 'Précedent',
                                        onpress: (){
                                          if(!formKey.currentState!.validate()){
                                            return;
                                          }
                                        //  Get.to(()=>LoginView2());
                                          setState(() {
                                            _isShow1 = true;
                                            _isShow2 = false;
                                          });

                                        },
                                        width: 130.0,
                                        height: 40.0,
                                        icon: Icon(
                                            Icons.chevron_left_outlined
                                        )
                                    ),
                                    elevatedButton(
                                      text: 'Créer un compte',
                                      onpress: (){
                                        if(!formKey.currentState!.validate()){
                                          return;
                                        }
                                      },
                                      width: 130.0,
                                      height: 40.0,
                                    ),
                                  ],
                                ),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                myText(
                    text: 'Vous avez déjà un compte?',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                    textAlign: TextAlign.center
                ),
                textButton(
                  text: 'Se connecter',
                  fontSize: 20.0,
                   color: AppColors.orange
                )
              ],
            ),

        ),
      ),
    );
  }
}
