import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}


//manage notification
class _NotificationState extends State<Notification> {

  String notificationMsg = "Waiting for notifications";
  String typeNotif = "";

  @override
  void initState(){
    super.initState();

    getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });


    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        setState(() {
          typeNotif = message.notification!.title!;
          if(typeNotif == "Detail"){
            print('teste terminate State condition Redirection Page');
            //Get.to(()=> const Details());
          }

          print('teste terminate condition event @@@@@@@@@ $typeNotif');
        });
      }
      print('teste Terminate without condition event @@@@@@@@@ f');
      // Get.to(()=> const Details());
      //Get.to(()=> const Details());
    });


    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      setState(() {
        if (message != null) {

          typeNotif = "${message.notification!.title}";
          notificationMsg =
          "${message.notification!.title} ${message.notification!
              .body} I am coming from background";
          print('teste background condition @@@@@@@@@ $typeNotif');
          if(typeNotif == "Detail"){
            print('teste background condition Redirection Page');
            //Get.to(()=> const Details());
          }

        }
      });
    });
  }
  Future getDeviceToken() async {
    //request user permission for push notification
    FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging _firebaseMessage = FirebaseMessaging.instance;
    String? deviceToken = await _firebaseMessage.getToken();
    return (deviceToken == null) ? "" : deviceToken;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}