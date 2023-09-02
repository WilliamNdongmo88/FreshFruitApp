import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../HomePage.dart';

class Sing_In extends StatefulWidget {
  const Sing_In({super.key});

  @override
  State<Sing_In> createState() => _Sing_InState();
}

class _Sing_InState extends State<Sing_In> {
  List list = [];
  bool isSpinner = false;
  bool isOnPressButton = true;
  bool _passwordVisible = false;

  final String apiUrl = 'https://stagingapi.chipchip.social/v1/users/login';

  Future<dynamic> loginUser() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {"phone": "251912121212", "password": "12345678", "country": "ETH"},
      ),
    );

    if (response.statusCode == 200) {
      print('statusCode:--> ${response.statusCode}');
      // print('responseData:--> ${json.decode(response.body)}');
      fulfillList();
      return json.decode(response.body);
    } else {
      throw Exception('Échec de la requête POST');
    }
  }

  var token;
  void getLoginUser() {
    setState(() {
      loginUser().then((response) {
        // print('response -------> : $response');
        token = response['data']['token'];
        // print('### token ----> $token');
        print('list --> $list');
        if (list.isEmpty) {
          print('isEmpty --> $list');
          changeValueBool();
        } else {
          print('isEmpty --> false');
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext
                          context,
                      Animation<
                              double>
                          animation,
                      Animation<
                              double>
                          secondaryAnimation) =>
                  HomePage(token: token),
            ),
          );
        }
      }).catchError((error) {
        print('Une erreur s\'est produite : $error');
      });
    });
  }

  fulfillList() {
    setState(() {
      list.add('json.decode(response.body)');
    });
  }

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  changeValueBool() {
    setState(() {
      isSpinner = true;
      isOnPressButton = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map inputData = {};
    bool boolValue = false;
    return Scaffold(
        body: ScreenUtilInit(
            designSize: const Size(360, 690),
            builder: (context, child) => Stack(
                  children: [
                    Container(
                      height: 350.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/image.png"),
                            fit: BoxFit.cover),
                      ),
                      child: Text(''),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 350.r),
                        height: 500.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 35.h,
                              ),
                              Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 82, 81, 81)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 82, 81, 81)),
                                          ),
                                          hintText: 'Email',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.text,
                                        controller: passwordController,
                                        obscureText: !_passwordVisible,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 82, 81, 81)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 82, 81, 81)),
                                          ),
                                          hintText: 'Password',
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: const Color(
                                                  0xFFB1B1B1), //Theme.of(context).primaryColorDark,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 55.h,
                                      ),
                                      SizedBox(
                                        height: 50.h,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25.sp),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              inputData["email"] =
                                                  emailController.text;
                                              inputData["password"] =
                                                  passwordController.text;
                                              inputData["boolValue"] =
                                                  boolValue;
                                              print('inputData--> $inputData');
                                              if (inputData["email"] != '' &&
                                                  inputData["password"] != '') {
                                                getLoginUser();
                                                
                                                // Navigator.of(context).push(
                                                //   PageRouteBuilder(
                                                //     pageBuilder: (BuildContext
                                                //                 context,
                                                //             Animation<double>
                                                //                 animation,
                                                //             Animation<double>
                                                //                 secondaryAnimation) =>
                                                //         HomePage(token:token),
                                                //   ),
                                                // );
                                              } else {
                                                print('Sign In --> Fail');
                                              }
                                            },
                                            child: Text(
                                              isOnPressButton == true
                                                  ? 'SIGN IN'
                                                  : '',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )),
                    if (isSpinner == true) ...[
                      Padding(
                        padding: EdgeInsets.only(left: 10.r, top: 555.r),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        ),
                      ),
                    ]
                  ],
                )));
  }
}
