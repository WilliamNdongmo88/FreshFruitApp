import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/Widgets.dart';
import 'auth/Controller.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String accessToken = '';
  void getToken() {
    DataController dataController = new DataController();
    var resp = dataController.loginUser().then((resp) {
      accessToken = resp['data']['token'];
    }).catchError((error) {
      print('Une erreur s\'est produite : $error');
    });
  }

  final String apiUrl = 'https://stagingapi.chipchip.social/v1/users/logout';

  Future<dynamic> logoutUser() async {
    getToken();
    print('accessToken---> $accessToken');
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Échec de la requête POST');
    }
  }

  void funChange(changetxt) {
    setState(() {
      // currentIndex = changetxt;
      // print('currentIndex--> $currentIndex');
      // txt = changetxt;
    });
  }

  late String userName;
  @override
  void initState() {
    userName = 'Rafatul islam';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) => SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 85.r, right: 20.r, left: 20.r, bottom: 10.r),
                      child: Container(
                        margin: EdgeInsets.only(left: 75.r, top: 10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Profile',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 710.r),
                      child: Center(
                        child: ElevatedButton(
                          child: Text('Se déconnecter'),
                          onPressed: () {
                            logoutUser().then((response) {
                              print('Réponse du serveur : $response');
                            }).catchError((error) {
                              print('Une erreur s\'est produite : $error');
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            getFooters(callBackFunction: funChange, currentIndex: 4),
      ),
    );
  }
}
