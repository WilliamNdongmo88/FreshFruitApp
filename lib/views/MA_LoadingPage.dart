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
                    controller: AnimationController(
                        vsync: this,
                        duration: const Duration(milliseconds: 120)),
                  )
                ]))));
  }
}
