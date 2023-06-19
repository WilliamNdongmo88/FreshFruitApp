import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/views/auth/MA_Login.dart';
import '../../controller/MA_AuthController.dart';
import '../../controller/MA_DataController.dart';
import '../../utils/MA_Styles.dart';
import '../../utils/MA_Widgets.dart';
import 'MA_Signup.dart';

class MaSignupView extends StatefulWidget {
  const MaSignupView({Key? key}) : super(key: key);

  @override
  State<MaSignupView> createState() => _MaSignupViewState();
}

class _MaSignupViewState extends State<MaSignupView> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late AuthController authController;
  late DataController dataController;

  @override
  void initState(){
    super.initState();
    authController = Get.put(AuthController());
    dataController = Get.put(DataController());
  }

  RegExp regEx = new RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");

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
                    text: ' Signup ',
                    style: GoogleFonts.dmSans(
                            textStyle: TextStyle( fontSize: 32, fontWeight: FontWeight.bold)),
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
                      label: 'Email',
                      text: 'Entrez votre email',
                      validator: (String input){
                        if(input.isEmpty){
                          return 'Entrer votre Email';
                        }
                        if(!input.contains('@')){
                          return 'Email invalide';
                        }

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
                      bool: true,
                      icon: 'assets/icon_name.png',
                      label: 'PassWord',
                      text: 'Mot de Passe',
                      validator: (String input){

                        if(input.isEmpty){
                          return 'Entrer votre mot de passe';
                        }
                        if(input.length<8){
                          return 'The Pass should be at least 8 character';
                        }
                        if(regEx.hasMatch(input).toString()=='false'){
                          print("**** regex ****");
                          print(regEx.hasMatch(input).toString());
                          print(regEx.hasMatch(input));
                          return 'The  should at least 1 Upercase and 1 Lowercase';
                        }else{
                          print("**** regex else****");
                          print(regEx.hasMatch(input));
                        }
                      },
                      controller: passwordController
                  ),
                ),
                SizedBox(
                  height: 75,
                  child: myTextField(
                      bool: true,
                      icon: 'assets/icon_name.png',
                      label: 'Confirm PassWord',
                      text: 'Confirmez Mot de Passe',
                      validator: (String input){

                        if(input.isEmpty){
                          return 'Entrer votre mot de passe';
                        }
                        if(input.length<8){
                          return 'The Pass should be at least 8 character';
                        }
                        if(passwordController.text.trim()!= confirmPasswordController.text.trim()){
                          return 'password isn\'t the same';
                        }
                        if(regEx.hasMatch(input).toString()=='false'){
                          print("**** regex ****");
                          print(regEx.hasMatch(input).toString());
                          print(regEx.hasMatch(input));
                          return 'The  should at least 1 Upercase and 1 Lowercase';
                        }else{
                          print("**** regex else****");
                          print(regEx.hasMatch(input));
                        }
                      },
                      controller: confirmPasswordController
                  ),
                ),
                /*  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      labelText: "Username", //babel text
                      hintText: "Enter your email", //hint text
                      prefixIcon: Icon(Icons.people), //prefix iocn
                      hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //hint text style
                      labelStyle: TextStyle(fontSize: 17, color: Colors.redAccent),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),//label style
                    )
                ),*/
                SizedBox(
                  height: Get.height * 0.02,
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Obx(() => authController.isLoading.value? Center(child: CircularProgressIndicator(),) : Container(
                  height: 50,
                  child: elevatedButton(
                    text: ' Signup ',
                    onpress: (){
                      print('******* press on the connexion button ');
                      if(!formKey.currentState!.validate()){
                        return;
                      }

                      authController.signUp(email: emailController.text.trim(),password: passwordController.text.trim());

                     // Get.to(()=> SignupView());
                    },
                    width: 30.0,
                    height: 40.0,
                  ),
                ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                myText(
                    text: 'Vous avez déjà un compte?',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center),
                textButton(
                    text: ' Connectez vous ',
                    fontSize: 20.0,
                    color: AppColors.orange,
                    onpress: (){
                      print('******* press on the Connectez vous button ****');
                      Get.to(()=> LoginView());
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
