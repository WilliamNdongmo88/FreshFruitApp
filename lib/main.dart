import 'package:flutter/material.dart';
import 'package:money_app/utils/MA_Constant.dart';
import 'package:get/get.dart';
import 'package:money_app/views/auth/MA_Login.dart';
import 'package:money_app/views/auth/MA_Signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
        print("in fire qut check state");
        print(user);
          if (user != null) {
            print(user.uid);
          }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginView(),
    );
  }
}




