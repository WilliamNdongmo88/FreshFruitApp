import 'package:flutter/material.dart';
import 'package:money_app/controller/Helper%20classes/MA_Helper_Country.dart';
import 'package:money_app/utils/MA_Constant.dart';
import 'package:get/get.dart';
import 'package:money_app/views/MA_LoadingPage.dart';
import 'package:money_app/utils/MA_Styles.dart';
import 'package:money_app/utils/MA_TransactionItemDetails.dart';
import 'package:money_app/views/auth/MA_Login.dart';
import 'package:money_app/views/auth/MA_Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:money_app/views/app content/MA_Provider_CheckUser.dart';
import 'package:money_app/controller/MA_DataController.dart';
import 'package:money_app/views/homePage/MA_homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final DataController dataController = Get.put(DataController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: AppColors.mainAppColor),
      initialRoute: '/',
      routes: {
        TransactionListScreen.transactionListScreen: (context) => const TransactionListScreen(),
        TransactionScreen.transactionScreenPage: (context) => TransactionScreen(),
      },
      home: AppWrapper(),
    );
  }
}
class AppWrapper extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DataController dataController = Get.find<DataController>();
  ///DataController dataController = DataController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: checkUserLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //spinner of the application
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          //error screen
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.data == true) {
          print("connected");
          print(snapshot.data);
          //send him to dashboard
          //return Center(child: Text("*******send him to dashboard************"));
          return SignupView();
        } else {
          return LoginView();
        }
      },
    );
  }

  Future<bool> checkUserLoggedIn() async {
    bool res = false;
    List<MA_Helper_Country> listCountry = await  dataController.retrieveCountry();
    dataController.updateCountryList(listCountry);
      //save the contry
    await  FirebaseAuth.instance.authStateChanges().listen((User? user) {
        print("********** in fire qut check state **********");
        print(user);
        if (user != null) {
          print(user.uid);
          res=true;
        }
      });
    print("**************result of auth status change before retrun: $res ******");
    return res;

  }

}
