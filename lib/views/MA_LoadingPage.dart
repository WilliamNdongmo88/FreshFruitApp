import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:money_app/view/MA_LoadingPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/MA_Styles.dart';
import '../../utils/MA_Widgets.dart';
import '../controller/MA_DataController.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final DataController dataController = Get.find<DataController>();

  String notificationMsg = "Waiting for notifications";
  String typeNotif = "";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.repeat();

    getDeviceToken().then((value){
      if (kDebugMode) {
        print('device token');
        print(value);
        dataController.setToken(value);
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

  @override
  void dispose() {
    _animationController.dispose(); // Cancel the animation and dispose of the controller
    super.dispose();
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
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                child: Column(children: [
                  //  logo
                  //  comment test
                  Image.asset('assets/logo.png'),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  // first text of our loading page
                  myText(
                      text: 'Bienvenue',
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              fontSize: 65, fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: Get.height * 0.10,
                  ),
                  myText(
                      text: "AppMoney est une application de transfert",
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center),
                  myText(
                      text: " d'argent d'un pays à un autre",
                      style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  SizedBox(
                    height: Get.height * 0.10,
                  ),

                  // Make a spinner rotation // Make a spinner rotation
                  // and put the spinner like a button

                  SpinKitFadingCircle(
                    color: Color.fromARGB(240, 248, 61, 4),
                    size: 126.0,
                    controller: _animationController,/*AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 2500))*/
                  )
                ]))));
  }
}
