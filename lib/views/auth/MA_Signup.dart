import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/utils/MA_Styles.dart';

import '../../controller/Helper classes/MA_Helper_City.dart';
import '../../controller/Helper classes/MA_Helper_Country.dart';
import '../../controller/Helper classes/MA_Helper_User.dart';
import '../../controller/MA_AuthController.dart';
import '../../controller/MA_DataController.dart';
import '../../utils/MA_Widgets.dart';
import 'MA_Login.dart';
import 'MA_Signup2.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final DataController dataController = Get.find<DataController>();

 /* _SignupViewState(){
    selectedCountry = MA_Helper_Country(code:"CMR", name:"Cameroon", currency:"XAF",id:"CMR", iso2:"CM", iso3:"CMR", cities:[
      MA_Helper_City(id:"Douala-CMR", code:"Douala-CMR", name:"Douala", countryId: "CMR"),
      MA_Helper_City(id:"Yaoundé-CMR", code:"Yaoundé-CMR", name:"Yaoundé", countryId: "CMR")]);
    selectedCity = MA_Helper_City(id:"Yaoundé-CMR", code:"Yaoundé-CMR", name:"Yaoundé", countryId: "CMR");
  } */
  late List<MA_Helper_Country> countryList  ;


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

  TextEditingController colorController = TextEditingController();
  List<MA_Helper_City> lcities =  [MA_Helper_City(id:"Douala-CMR", code:"Douala-CMR", name:"Douala", countryId: "CMR")];

  late List<MA_Helper_City> cityList;
  MA_Helper_Country? selectedCountry;
  MA_Helper_City? selectedCity;

  late AuthController authController;
  ///late DataController dataController;
  bool _isShow1 = true;
  bool _isShow2 = false;

  List<String> categories = [];

 // List<MA_Helper_Country> countryList = <MA_Helper_Country>[];
 // List<MA_Helper_City> cityList = <MA_Helper_City>[];

  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController());
   //// dataController = Get.put(DataController());
    countryList = dataController.CountryListToDispatch.value ;
    colorController.text = '';
    //callRetrieveCountry();

    /*selectedCountry = MA_Helper_Country(code:"CMR", name:"Cameroon", currency:"XAF",id:"CMR", iso2:"CM", iso3:"CMR", cities:[
        MA_Helper_City(id:"Douala-CMR", code:"Douala-CMR", name:"Douala", countryId: "CMR"),
        MA_Helper_City(id:"Yaoundé-CMR", code:"Yaoundé-CMR", name:"Yaoundé", countryId: "CMR")]);
    selectedCity = MA_Helper_City(id:"Yaoundé-CMR", code:"Yaoundé-CMR", name:"Yaoundé", countryId: "CMR");*/
    cityList = [];

    print("****** in InitState Country List ******* $countryList\n ");
    print(countryList);
    for(var country in countryList){
      print("*** in initState  **** \n");
      print(country.name);
    }

    dataController.isLoading.value = false;
    /*selectedCountry = countryList[1];
    selectedCity = countryList[1]?.cities[1] as MA_Helper_City;*/
  }


 /*Future<void> callRetrieveCountry() async  {
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
    selectedCountry = countryList[0];
    selectedCity = countryList[0]?.cities[0] as MA_Helper_City;
  }*/
  String? val;
  Future<void> callCreateUser(MA_Helper_User user) async{
    print("*********** in the callCreatUser ***********");
    print("the valeur of val before the await ist : $val");
      val = await dataController.createUser(user);
     print("the valeur of val after the await ist : $val");
  }


  @override
  Widget build(BuildContext context) {

   /* print("****** in Widget Country List ******* $countryList\n ");
    print(countryList);
    for(var country in countryList){
      print("*** in initState  **** \n");
      print(country.name);
    }*/

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
          child: Column(
              children: [
                Image.asset('assets/logo.png'),
                SizedBox(
                  height: Get.height * 0.01.h,
                ),
                myText(
                  text: 'Inscription',
                  style: GoogleFonts.dmSans(
                      textStyle: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)
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
                                  height: Get.height * 0.03.h,
                                ),
                                SizedBox(
                                  height: 75.h,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/icon_name.png',
                                      text: 'entrez votre Nom',
                                      label: 'Nom',
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
                                  height: Get.height * 0.01.h,
                                ),
                                SizedBox(
                                  height: 75.h,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/icon_name.png',
                                      label: 'Prenom',
                                      text: 'Entrez votre Prenom',
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
                                  height: Get.height * 0.01.h,
                                ),
                                DropdownButtonFormField(
                                    value: selectedCountry,
                                    items: countryList.map(
                                            (e) => DropdownMenuItem(child: Text(e.name), value: e,)
                                    ).toSet().toList(),
                                    onChanged: (val){
                                      setState(() {
                                        selectedCity= null;
                                        print(selectedCity);
                                        cityList.clear();
                                        print("****cityList just after the clear****");
                                        print(cityList);
                                        selectedCountry = val as MA_Helper_Country;
                                        cityList = val?.cities.toSet().toList() as List<MA_Helper_City>;
                                        print("****cityList after the set up****");
                                        print(cityList);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Pays",
                                      labelStyle: TextStyle(fontSize: 18.sp),
                                      border: OutlineInputBorder(),
                                    ),

                                ),
                                SizedBox(
                                  height: Get.height * 0.02.h,
                                ),
                                DropdownButtonFormField(
                                  value: selectedCity,
                                  items: cityList.map(
                                          (e) => DropdownMenuItem(child: Text(e.name), value: e,)
                                  ).toSet().toList(),
                                  onChanged: (val){
                                    setState(() {
                                      selectedCity = val as MA_Helper_City;
                                      //cityList.clear();
                                    });

                                  },
                                  decoration: InputDecoration(
                                      labelText: "Ville",
                                      labelStyle: TextStyle(fontSize: 18.sp),
                                      border: OutlineInputBorder(),
                                  ),

                                ),
                                SizedBox(
                                  height: Get.height * 0.01.h,
                                ),
                                /*SizedBox(
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
                                ),*/
                                SizedBox(
                                  height: Get.height * 0.01.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    elevatedButton(
                                      text: 'Annuler',
                                      onpress: (){
                                        print("***** click on the Annuler button *******");
                                        authController.logout();
                                        Get.to(()=> LoginView());
                                      },
                                      width: 130.w,
                                      height: 40.h,
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
                                        width: 130.w,
                                        height: 40.h,
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
                                  height: Get.height * 0.02.h,
                                ),
                                SizedBox(
                                  height: 75.h,
                                  child: myTextField(
                                      bool: false,
                                      icon: 'assets/phone_icon.png',
                                      text: 'Numero de Telephone',
                                      label: 'Telephone',
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
                                  height: 75.h,
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
                                  height: Get.height * 0.03.h,
                                ),
                                Card(),
                                SizedBox(
                                  width: 400.w,
                                  height: 100.h,
                                  child: Column(
                                    children: [
                                      myText(
                                          text: 'Telecharger une pièce d\'identité \n ( CNI ou Passport)',
                                          style: GoogleFonts.dmSans(
                                              textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal)
                                          ),
                                          textAlign: TextAlign.center
                                      ),
                                      IconButton(
                                        icon:  Icon(
                                          Icons.cloud_upload_outlined,
                                          size: 50.sp,
                                        ),
                                        color: AppColors.orange,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    elevatedButtonright(
                                        text: 'Précedent',
                                        onpress: (){
                                         /* if(!formKey.currentState!.validate()){
                                            return;
                                          }*/
                                        //  Get.to(()=>LoginView2());
                                          setState(() {
                                            _isShow1 = true;
                                            _isShow2 = false;
                                          });
                                          dataController.isLoading.value = false;
                                        },
                                        width: 130.w,
                                        height: 40.h,
                                        icon: Icon(
                                            Icons.chevron_left_outlined
                                        )
                                    ),
                                    Obx(()=> dataController.isLoading.value? Center(child: CircularProgressIndicator(),) :Container(
                                      child: elevatedButton(
                                        text: 'Créer un compte',
                                        onpress: (){
                                          print("**** press on Créer un compte ****");
                                          if(!formKey.currentState!.validate()){
                                            return;
                                          }
                                          MA_Helper_User usr = MA_Helper_User(
                                              FirebaseAuth.instance.currentUser?.uid as String,
                                            prenomController.text.trim(),
                                            nomController.text.trim() ,
                                            emailController.text.trim(),
                                            selectedCountry?.id as String,
                                            selectedCity?.id as String,
                                            telephoneController.text.trim(),
                                            "M"
                                          );

                                          callCreateUser(usr);
                                        },
                                        width: 130.w,
                                        height: 40.h,
                                      ),
                                    ),
                                    )
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
                  height: Get.height * 0.03.h,
                ),
                myText(
                    text: 'Vous avez déjà un compte?',
                    style: GoogleFonts.dmSans(
                        textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)
                    ),
                    textAlign: TextAlign.center
                ),
                textButton(
                  text: 'Se connecter',
                  fontSize: 20.sp,
                  color: AppColors.orange,
                    onpress: (){
                      print('******* press on the Se connecter button ****');
                      Get.to(()=> LoginView());
                    }
                )
              ],
            ),

        ),
      ),
    );
  }
}

enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}




