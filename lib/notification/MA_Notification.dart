import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/MA_AuthController.dart';
import '../controller/MA_DataController.dart';
import '../utils/MA_Widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final DataController dataController = Get.find<DataController>();
  late AuthController authController ;
  String? token;

  @override
  void initState(){
    super.initState();
    token = dataController.token.value;

    print("*** the token value : $token ");
    authController = Get.put(AuthController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.3,
              ),
              Text('the token value is :',style: TextStyle(fontSize: 14)),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Text('$token',style: TextStyle(fontSize: 14),),
              SizedBox(
                height: Get.height * 0.1,
              ),
              elevatedButton(
                text: 'Log Out',
                onpress: (){
                  print('******* press on the logout button in Notification ** ');
                  // authController.signUp(email: emailController.text.trim(),password: passwordController.text.trim());
                    authController.logout();
                },
                width: 30.0,
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
