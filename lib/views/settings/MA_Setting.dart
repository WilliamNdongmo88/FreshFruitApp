import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:money_app/component/MA_BottomNavigationBar.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 0, right: 40, bottom: 0),
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
                  const Padding(
                    padding: EdgeInsets.only(top: 0, right: 93, bottom: 0),
                    child: Text(
                      "Paramètre",
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const UserProfil()));
                      },
                      icon: SvgPicture.asset("assets/icons/icon_profil.svg")),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const UserProfil()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Mon profil'),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/icon_language.svg")),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500)),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Langue'),
                      ))
                ],
              ),
              const SizedBox(height: 10),
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
                                "assets/icons/icon_points.svg")),
                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500)),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Mes points'),
                            ))
                      ],
                    ),
                    const Text(
                      '120 points',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
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
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500)),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Notifications'),
                            ))
                      ],
                    ),
                    FlutterSwitch(
                      activeColor: const Color(0xFFF24E1E),
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
              const SizedBox(height: 10),
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
                                "assets/icons/icon_status.svg")),
                        TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500)),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text('Status du compte'),
                            ))
                      ],
                    ),
                    const Text(
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
              const SizedBox(height: 10),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/icon_comment.svg")),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500)),
                      onPressed: () {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            actionsAlignment: MainAxisAlignment.spaceBetween,
                            contentPadding: EdgeInsets.zero,
                            insetPadding: EdgeInsets.zero,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/icon_commentalert.svg"),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Commentaires sur l’application',
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: "DM Sans",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            content: SizedBox(
                              height: 137,
                              width: 100,
                              child: Column(
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 15,
                                        left: 25,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      'Avez-vous des suggestions ou des commentaire à faire sur notre applications?\nnous vous écoutons:',
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          height: 1.7,
                                          fontFamily: "DM Sans",
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: 20, left: 20),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF6F6F6F))),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF6F6F6F)))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFFF2F1F1),
                                      foregroundColor: const Color(0xFF6F6F6F)),
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text(
                                    'Annuler',
                                    style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xFFF24E1E),
                                      foregroundColor: const Color(0xFF000000)),
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text(
                                    'Soumettre',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Inter"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Commentaires sur l’application'),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/icon_help.svg")),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500)),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Aide'),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Padding(padding: EdgeInsets.only(right: 15, left: 20)),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/icon_aboutus.svg")),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w500)),
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('A propos'),
                      ))
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: const bottom_navigation_bar(currentIndex: 3),
      ),
    );
  }
}
