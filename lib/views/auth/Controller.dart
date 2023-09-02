import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataController extends GetxController {
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
      return json.decode(response.body);
    } else {
      throw Exception('Échec de la requête POST');
    }
  }

  final String apiUrllogout =
      'https://stagingapi.chipchip.social/v1/users/logout';

  Future<dynamic> logoutUser() async {
    var token;
    DataController dataController = new DataController();
    var resp = dataController.loginUser().then((resp) {
      token = resp['data']['token'];
    }).catchError((error) {
      print('Une erreur s\'est produite : $error');
    });

    final response = await http.post(
      Uri.parse(apiUrllogout),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Échec de la requête POST');
    }
  }
}
