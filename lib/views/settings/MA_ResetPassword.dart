import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final ancienMotDepasse = TextEditingController();
  final nouveauMotDePasse = TextEditingController();
  final confirmerMotDePasse = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    ancienMotDepasse.dispose();
    nouveauMotDePasse.dispose();
    confirmerMotDePasse.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 80),
              Form(
                key: _formKey,
                child: Container(
                  child: Column(
                    children: [
                      Image.asset("assets/images/logo_app.png"),
                      SizedBox(height: 5),
                      Text(
                        'Réinitialiser  votre mot de passe',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, left: 25),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              label: RichText(
                                text: TextSpan(
                                    text: 'Ancien mot de passe',
                                    style: TextStyle(
                                      color: Color(0xFF6F6F6F),
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              color: Color(0xFFF24E1E)))
                                    ]),
                              ),
                              hintText: '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                              hintStyle: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'DM Sans',
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF24E1E))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF6F6F6F),
                              )),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/icons/icon_lock.svg"),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Veillez entrer votre mot de passe";
                            }
                            return null;
                          },
                          controller: ancienMotDepasse,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Choisissez un mot de passe sécurisé .',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Niveau de sécurité du mot de passe :',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Utilisez au moins 8 caractères.',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, left: 25),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              label: RichText(
                                text: TextSpan(
                                    text: 'Nouveau mot de passe',
                                    style: TextStyle(
                                      color: Color(0xFF6F6F6F),
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              color: Color(0xFFF24E1E)))
                                    ]),
                              ),
                              hintText: '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                              hintStyle: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'DM Sans',
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF24E1E))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF6F6F6F),
                              )),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/icons/icon_lock.svg"),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Veuillez entrer un mot de passe correct";
                            }
                            return null;
                          },
                          controller: nouveauMotDePasse,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Les deux mots de passe doivent être \n                        identique',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, left: 25),
                        child: TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              label: RichText(
                                text: TextSpan(
                                    text: 'Confirmer votre mot de passe',
                                    style: TextStyle(
                                      color: Color(0xFF6F6F6F),
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '*',
                                          style: TextStyle(
                                              color: Color(0xFFF24E1E)))
                                    ]),
                              ),
                              hintText: '⬮⬮⬮⬮⬮⬮⬮⬮⬮',
                              hintStyle: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'DM Sans',
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFF24E1E))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Color(0xFF6F6F6F),
                              )),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/icons/icon_lock.svg"),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Les deux mots de passe ne sont pas identique";
                            }
                            return null;
                          },
                          controller: confirmerMotDePasse,
                        ),
                      ),
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Padding(padding: EdgeInsets.only(right: 5, left: 5)),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final rpAncien = ancienMotDepasse.text;
                                  final rpNouveau = nouveauMotDePasse.text;
                                  final rpConfirmer = confirmerMotDePasse.text;

                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());

                                  print(rpAncien +
                                      ' ' +
                                      rpNouveau +
                                      ' ' +
                                      rpConfirmer);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(57, 20, 57, 20),
                                  backgroundColor: Color(0xFFF24E1E)),
                              child: Text(
                                'Confirmer',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
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
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
