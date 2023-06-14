import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_app/views/settings/MA_UserProfil.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key, required this.title});

  final String title;

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  final _formKey = GlobalKey<FormState>();

  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final emailController = TextEditingController();
  final paysController = TextEditingController();
  final villeController = TextEditingController();
  final telephoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    nomController.dispose();
    prenomController.dispose();
    emailController.dispose();
    paysController.dispose();
    villeController.dispose();
    telephoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),*/
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 20, left: 0, right: 40, bottom: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 30, left: 0, right: 0, bottom: 20),
                  child: IconButton(
                      iconSize: 70,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) => UserProfil()));
                      },
                      icon: SvgPicture.asset("assets/icons/icon_back.svg")),
                ),
              ),
              Container(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 30, left: 0, right: 60, bottom: 20),
                  child: Text(
                    "Modifier profil",
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
          Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.only(top: 1, bottom: 40, right: 10, left: 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DM Sans'),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: RichText(
                          text: TextSpan(
                              text: 'Nom',
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                              ),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Color(0xFFF24E1E)))
                              ]),
                        ),
                        hintText: 'Nom',
                        labelStyle: TextStyle(color: Color(0xFF6F6F6F)),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                        ),
                        //focusedErrorBorder: OutlineInputBorder(borderSide: Color(0xFFF24E1E),),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF6F6F6F),
                        )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/icons/icon_name.svg"),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: nomController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DM Sans'),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: RichText(
                          text: TextSpan(
                              text: 'Prénom',
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                              ),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Color(0xFFF24E1E)))
                              ]),
                        ),
                        hintText: 'Prénom',
                        labelStyle: TextStyle(color: Color(0xFF6F6F6F)),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF6F6F6F),
                        )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/icons/icon_name.svg"),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: prenomController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DM Sans'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: RichText(
                          text: TextSpan(
                              text: 'Email',
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                              ),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Color(0xFFF24E1E)))
                              ]),
                        ),
                        hintText: 'Email',
                        labelStyle: TextStyle(color: Color(0xFF6F6F6F)),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF6F6F6F),
                        )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child:
                              SvgPicture.asset("assets/icons/icon_email.svg"),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: emailController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DM Sans'),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: RichText(
                          text: TextSpan(
                              text: 'Pays',
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                              ),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Color(0xFFF24E1E)))
                              ]),
                        ),
                        hintText: 'Pays',
                        labelStyle: TextStyle(color: Color(0xFF6F6F6F)),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF6F6F6F),
                        )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child:
                              SvgPicture.asset("assets/icons/icon_country.svg"),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: paysController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DM Sans'),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: RichText(
                          text: TextSpan(
                              text: 'Ville',
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                              ),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Color(0xFFF24E1E)))
                              ]),
                        ),
                        hintText: 'Ville',
                        labelStyle: TextStyle(color: Color(0xFF6F6F6F)),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF6F6F6F),
                        )),
                        prefixIcon: Padding(
                          padding:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: SvgPicture.asset(
                              "assets/icons/icon_locationcity.svg"),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: villeController,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DM Sans'),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: RichText(
                          text: TextSpan(
                              text: 'Téléphone',
                              style: TextStyle(
                                color: Color(0xFF6F6F6F),
                              ),
                              children: [
                                TextSpan(
                                    text: '*',
                                    style: TextStyle(color: Color(0xFFF24E1E)))
                              ]),
                        ),
                        hintText: 'Téléphone',
                        labelStyle: TextStyle(color: Color(0xFF6F6F6F)),
                        hintStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'DM Sans',
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Color(0xFF6F6F6F),
                        )),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(10),
                          child:
                              SvgPicture.asset("assets/icons/icon_phone.svg"),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      },
                      controller: telephoneController,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('formulaire envoye');
                              final pName = nomController.text;
                              final pPrenom = prenomController.text;
                              final pEmail = emailController.text;
                              final pPays = paysController.text;
                              final pVille = villeController.text;
                              final pTelephone = telephoneController.text;

                              FocusScope.of(context).requestFocus(FocusNode());
                              print(pName +
                                  ' ' +
                                  pPrenom +
                                  ' ' +
                                  pEmail +
                                  ' ' +
                                  pPays +
                                  ' ' +
                                  pVille +
                                  ' ' +
                                  pTelephone);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(57, 20, 57, 20),
                              backgroundColor: Color(0xFFF24E1E)),
                          child: Text(
                            'Modifier',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              //color: Color(0XFF24E1E),
                            ),
                          )),
                      SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.fromLTRB(57, 20, 57, 20),
                              backgroundColor: Color(0xFFF24E1E)),
                          child: Text(
                            'Annuler',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Inter',
                              //color: Color(0XFF24E1E),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
