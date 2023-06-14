import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:money_app/views/settings/MA_UserProfil.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 0, right: 60, bottom: 0),
                    child: IconButton(
                        iconSize: 70,
                        onPressed: () {
                          /*
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => EventForPage()));*/
                        },
                        icon: SvgPicture.asset("assets/icons/icon_back.svg")),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, right: 70, bottom: 0),
                    child: Text(
                      "Paramètre",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => UserProfil()));
                    },
                    icon: SvgPicture.asset("assets/icons/icon_profil.svg")),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => UserProfil()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('Mon profil'),
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/icon_language.svg")),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('Langue'),
                    ))
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon:
                              SvgPicture.asset("assets/icons/icon_points.svg")),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Mes points'),
                          ))
                    ],
                  ),
                  Text(
                    '120 points',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              "assets/icons/icon_notification.svg")),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Notifications'),
                          ))
                    ],
                  ),
                  FlutterSwitch(
                    activeColor: Color(0xFFF24E1E),
                    width: 40.0,
                    height: 20.0,
                    valueFontSize: 12.0,
                    toggleSize: 18.0,
                    value: status,
                    onToggle: (val) {
                      setState(() {
                        status = val;
                      });
                      print('value toggle $status ');
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon:
                              SvgPicture.asset("assets/icons/icon_status.svg")),
                      TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Status du compte'),
                          ))
                    ],
                  ),
                  Text(
                    'Activé',
                    style: TextStyle(
                        color: Color(0xFF008000),
                        fontSize: 18,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/icon_comment.svg")),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('Commentaires sur l’application'),
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/icon_help.svg")),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('Aide'),
                    ))
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/icon_aboutus.svg")),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text('A propos'),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
