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
    return SafeArea(
      child: Scaffold(
          /*appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
          ),*/
          body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 0, right: 0, bottom: 20),
                  child: IconButton(
                      iconSize: 70,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const UserProfil()));
                      },
                      icon: SvgPicture.asset("assets/icons/icon_back.svg")),
                ),
                const Padding(
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
                )
              ],
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 1, bottom: 40, right: 10, left: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          label: RichText(
                            text: const TextSpan(
                                text: 'Nom',
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style:
                                          TextStyle(color: Color(0xFFF24E1E)))
                                ]),
                          ),
                          hintText: 'lisa balae',
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          errorStyle: const TextStyle(color: Color(0xFFF24E1E)),
                          labelStyle: const TextStyle(color: Color(0xFF6F6F6F)),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                          ),
                          //focusedErrorBorder: OutlineInputBorder(borderSide: Color(0xFFF24E1E),),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF6F6F6F),
                          )),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                SvgPicture.asset("assets/icons/icon_name.svg"),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer votre Nom";
                          }
                          return null;
                        },
                        controller: nomController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          label: RichText(
                            text: const TextSpan(
                                text: 'Prénom',
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style:
                                          TextStyle(color: Color(0xFFF24E1E)))
                                ]),
                          ),
                          hintText: 'Camilla',
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          errorStyle: const TextStyle(color: Color(0xFFF24E1E)),
                          labelStyle: const TextStyle(color: Color(0xFF6F6F6F)),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF6F6F6F),
                          )),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                SvgPicture.asset("assets/icons/icon_name.svg"),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer votre Prénom";
                          }
                          return null;
                        },
                        controller: prenomController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: RichText(
                            text: const TextSpan(
                                text: 'Email',
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style:
                                          TextStyle(color: Color(0xFFF24E1E)))
                                ]),
                          ),
                          hintText: 'lisaCamila@gmail.com',
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          errorStyle: const TextStyle(color: Color(0xFFF24E1E)),
                          labelStyle: const TextStyle(color: Color(0xFF6F6F6F)),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF6F6F6F),
                          )),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                SvgPicture.asset("assets/icons/icon_email.svg"),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer votre Email";
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          label: RichText(
                            text: const TextSpan(
                                text: 'Pays',
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style:
                                          TextStyle(color: Color(0xFFF24E1E)))
                                ]),
                          ),
                          hintText: 'Cameroun',
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          errorStyle: const TextStyle(color: Color(0xFFF24E1E)),
                          labelStyle: const TextStyle(color: Color(0xFF6F6F6F)),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF6F6F6F),
                          )),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                                "assets/icons/icon_country.svg"),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer votre Pays";
                          }
                          return null;
                        },
                        controller: paysController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          label: RichText(
                            text: const TextSpan(
                                text: 'Ville',
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style:
                                          TextStyle(color: Color(0xFFF24E1E)))
                                ]),
                          ),
                          hintText: 'Yaounde',
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          errorStyle: const TextStyle(color: Color(0xFFF24E1E)),
                          labelStyle: const TextStyle(color: Color(0xFF6F6F6F)),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF6F6F6F),
                          )),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10),
                            child: SvgPicture.asset(
                                "assets/icons/icon_locationcity.svg"),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer votre Ville";
                          }
                          return null;
                        },
                        controller: villeController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 35, left: 35),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DM Sans'),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          label: RichText(
                            text: const TextSpan(
                                text: 'Téléphone',
                                style: TextStyle(
                                  color: Color(0xFF6F6F6F),
                                ),
                                children: [
                                  TextSpan(
                                      text: '*',
                                      style:
                                          TextStyle(color: Color(0xFFF24E1E)))
                                ]),
                          ),
                          hintText: '+237 691 886 084',
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF6F6F6F)),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          errorStyle: const TextStyle(color: Color(0xFFF24E1E)),
                          labelStyle: const TextStyle(color: Color(0xFF6F6F6F)),
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'DM Sans',
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6F6F6F))),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF6F6F6F),
                          )),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child:
                                SvgPicture.asset("assets/icons/icon_phone.svg"),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer votre numéro deTéléphone";
                          }
                          return null;
                        },
                        controller: telephoneController,
                      ),
                    ),
                    const SizedBox(height: 30),
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

                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                /*print(pName +
                                    ' ' +
                                    pPrenom +
                                    ' ' +
                                    pEmail +
                                    ' ' +
                                    pPays +
                                    ' ' +
                                    pVille +
                                    ' ' +
                                    pTelephone);*/
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(57, 20, 57, 20),
                                backgroundColor: const Color(0xFFF24E1E)),
                            child: const Text(
                              'Modifier',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                                //color: Color(0XFF24E1E),
                              ),
                            )),
                        const SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(57, 20, 57, 20),
                                backgroundColor: const Color(0xFFF24E1E)),
                            child: const Text(
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
      )),
    );
  }
}
