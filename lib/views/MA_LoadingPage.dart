import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:money_app/view/MA_LoadingPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/MA_Styles.dart';
import '../../utils/MA_Widgets.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with TickerProviderStateMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Form(
                    key: formKey,
                    child: Column(children: [
                      //  this image is the logo that we want to display
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
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: Get.height * 0.10,
                      ),
                      myText(
                          text: "AppMoney est une application de",
                          style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          textAlign: TextAlign.center),
                      myText(
                          text: "transfert d'argent d'un pays à un autre",
                          style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          textAlign: TextAlign.center),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      SpinKitCircle(
                        color: Colors.orange[700],
                        size: 70.0,
                        controller: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 1200)),
                      )
                    ])))));
  }
}
