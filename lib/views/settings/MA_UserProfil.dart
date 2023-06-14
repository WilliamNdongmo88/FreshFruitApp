import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_app/views/settings/MA_Setting.dart';
import 'package:money_app/views/settings/MA_EditProfil.dart';
import 'package:money_app/views/settings/MA_ResetPassword.dart';

//MA_EditProfil
class UserProfil extends StatelessWidget {
  const UserProfil({Key? key}) : super(key: key);
  final ttext = 'norel aboty';
  final isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                      child: IconButton(
                          iconSize: 70,
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => Setting()));
                          },
                          icon: SvgPicture.asset("assets/icons/icon_back.svg")),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 0, left: 0, right: 60, bottom: 0),
                      child: Text(
                        "Mon profil",
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
              SizedBox(
                height: 186,
                width: 212,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/user_image.png"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                                "assets/icons/icon_photo.svg")),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Nom',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF6F6F6F)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'lisaCamila',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20),
                            //Text(''),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              EditProfil(
                                                title: 'test test ',
                                              )));
                                },
                                icon: SvgPicture.asset(
                                    "assets/icons/icon_edit.svg")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF6F6F6F)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'norelabotyi4@gmail',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20),
                            //Text(''),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              EditProfil(
                                                title: 'test test ',
                                              )));
                                },
                                icon: SvgPicture.asset(
                                    "assets/icons/icon_edit.svg")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Pays',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF6F6F6F)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Yaounde, Cameroun',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20),
                            //Text(''),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              EditProfil(
                                                title: 'test test ',
                                              )));
                                },
                                icon: SvgPicture.asset(
                                    "assets/icons/icon_edit.svg")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Téléphone',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF6F6F6F)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '+237 691886084',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20),
                            //Text(''),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              EditProfil(
                                                title: 'test test ',
                                              )));
                                },
                                icon: SvgPicture.asset(
                                    "assets/icons/icon_edit.svg")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 40, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text(
                              'Mot de passe',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF6F6F6F)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF000000)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 20),
                            //Text(''),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (_, __, ___) =>
                                              ResetPassword()));
                                },
                                icon: SvgPicture.asset(
                                    "assets/icons/icon_edit.svg")),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon:
                            SvgPicture.asset("assets/icons/icon_dwonload.svg")),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Modifier pièce d’identité",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                actionsAlignment: MainAxisAlignment.center,
                                contentPadding: EdgeInsets.zero,
                                title: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                            "assets/icons/icon_personadddesable.svg")),
                                    const Text(
                                      'Souhaitez-vous desactiver\nvotre compte?',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                //content: const Text('AlertDialog description'),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            right: 30,
                                            bottom: 15,
                                            left: 30),
                                        backgroundColor: Color(0xFFF2F1F1),
                                        foregroundColor: Color(0xFF6F6F6F)),
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Non'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            right: 35,
                                            bottom: 15,
                                            left: 35),
                                        backgroundColor: Color(0xFFF24E1E),
                                        foregroundColor: Color(0xFF000000)),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('Oui'),
                                  ),
                                ],
                              ),
                            ),
                        icon:
                            SvgPicture.asset("assets/icons/icon_person+.svg")),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Desactiver votre compte",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.only(
                                top: 17, left: 40, bottom: 17, right: 40)),
                            backgroundColor:
                                MaterialStatePropertyAll(Color(0xFFF24E1E))),
                        onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                actionsAlignment: MainAxisAlignment.center,
                                title: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                            "assets/icons/icon_cancel.svg")),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 10),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Déconnexion',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Text(
                                            'Vous allez être déconnecter !',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF6F6F6F)),
                                            textAlign: TextAlign.center),
                                      ),
                                    )
                                  ],
                                ),
                                //const Text('Vous allez être déconnecter !'),
                                actions: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            right: 30,
                                            bottom: 15,
                                            left: 30),
                                        backgroundColor: Color(0xFFF2F1F1),
                                        foregroundColor: Color(0xFF6F6F6F)),
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Annuler'),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.only(
                                            top: 15,
                                            right: 35,
                                            bottom: 15,
                                            left: 35),
                                        backgroundColor: Color(0xFFF24E1E),
                                        foregroundColor: Color(0xFF000000)),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text(
                                      'oui',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Inter'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        child: Text(
                          "Se deconnecter",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
