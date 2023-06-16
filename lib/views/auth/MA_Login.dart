import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/controller/MA_AuthController.dart';

import '../../controller/Helper classes/MA_Helper_City.dart';
import '../../controller/Helper classes/MA_Helper_Country.dart';
import '../../controller/MA_DataController.dart';
import '../../utils/MA_Styles.dart';
import '../../utils/MA_Widgets.dart';
import 'MA_Signup.dart';
import 'MA_Signup2.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController username = TextEditingController();

  /*Future<void> testlogin(emailAddress, password) async{
    print('test login testlogin');
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  } */
  late AuthController authController;
  late DataController dataController;

  List<MA_Helper_Country> countryList = <MA_Helper_Country>[];
  List<MA_Helper_City> cityList = <MA_Helper_City>[];

  MA_Helper_Country?  selectedCountry;
  MA_Helper_City? selectedCity ;

  @override
  void initState(){
    super.initState();
    authController = Get.put(AuthController());
    dataController = Get.put(DataController());
    callRetrieveCountry();
  }

  Future<void> callRetrieveCountry() async  {
    countryList = await dataController.retrieveCountry();
    print("****** in callRetrieveCountry Country List ******* $countryList \n ");
    print(countryList);
    for(var country in countryList){
      print("*** in callRetrieveCountry $country **** \n");
      print(country.name);
      for(var city in country.cities){
        print("City ");
        print(city.name);
        print("\n");
      }
    }
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
                    text: 'Connexion',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center),
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
                      // final bool rgx = regEx.hasMatch(input).toString() as bool;
                        if(input.isEmpty){
                         // Get.snackbar('Warning', 'Le Mot de passe est requis.',colorText: Colors.white,backgroundColor: Colors.blue);
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
                myText(
                    text: 'Mot de passe oublié?',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: AppColors.blueText)),
                    textAlign: TextAlign.right),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Obx(() => authController.isLoading.value? Center(child: CircularProgressIndicator(),) : Container(
                    height: 50,
                      child: elevatedButton(
                        text: 'Connexion',
                        onpress: (){
                          print('******* press on the connexion button ');
                          if(!formKey.currentState!.validate()){
                            return;
                          }

                         // authController.signUp(email: emailController.text.trim(),password: passwordController.text.trim());
                           authController.login(email: emailController.text.trim(),password: passwordController.text.trim());

                        },
                        width: 30.0,
                        height: 40.0,
                      ),
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
                        onPressed: () {
                          //  Get.to(()=> ProfileScreen());
                        }),
                    socialAppsIcons(
                        text: 'assets/google.png',
                        onPressed: (){

                          authController.signInWithGoogle();

                        }

                    ),

                  ],
                ),
                myText(
                    text: 'Vous n\'avez pas encore de compte?',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    textAlign: TextAlign.center),
                textButton(
                    text: 'Creer un compte',
                    fontSize: 20.0,
                    color: AppColors.orange,
                    onpress: (){
                      print('******* press on the Créer un compte button ');
                      Get.to(()=> MaSignupView());
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
