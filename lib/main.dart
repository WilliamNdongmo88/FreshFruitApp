
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/utils/CallableWidget.dart';
import 'package:money_app/utils/Styles.dart';
import 'package:money_app/views/HomePage.dart';
import 'package:money_app/views/ProductDetails.dart';
import 'package:money_app/views/Profile.dart';
import 'package:money_app/views/auth/signIn.dart';
import 'firebase_options.dart';

//librairies notifications

import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Notification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: AppColors.mainAppColor),
          home: 
          const Sing_In(),
          //HomePage(token: null),
          //const ProductDetails(),
        );
      },
      designSize: const Size(412, 915),
    );
  }
}
