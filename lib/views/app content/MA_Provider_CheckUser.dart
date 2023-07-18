import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:money_app/controller/MA_DataController.dart';
import 'package:money_app/views/auth/MA_Signup.dart';

import '../homePage/MA_homePage.dart';

class AppContent extends StatefulWidget {
  @override
  State<AppContent> createState() => _AppContentState();
}

class _AppContentState extends State<AppContent> {
  FirebaseAuth auth = FirebaseAuth.instance;

  DataController dataController = Get.put(DataController());
late bool isNewUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callgetUser();
  }


  @override
   Widget build(BuildContext context)  {
    // Vérifier si l'utilisateur est un nouvel utilisateur ou un utilisateur existant
    // en fonction des données supplémentaires stockées dans Firebase Firestore ou Realtime Database.

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Mon application'),
      // ),
      body: FutureBuilder<bool>(
        future: getuser(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //spinner of the application
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            //error screen
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == true) {
            //Finish to fill the rest of information
            return SignupView();
          } else {
            //dashboard with all transactions
            return TransactionListScreen();
          }
        },
      ),
    );
  }

   Future<void> callgetUser()  async {
    bool result = await getuser();
    setState(() {
      isNewUser = result;
    });

  }

  Future<bool> getuser() async{
    print(FirebaseAuth.instance.currentUser);
    print("enter in nl_manage_users");
    dynamic result = await dataController.callCloudFunction("nl_manage_users", {"action": "GET-PROFILE"});
    print(result);

    if(result['ErrorCode'] ==null){
      if(result['message'] !=null){
        //empty result
        print('enter In empty response scope');
        print(result['message']);
        return true;
      }else{
        print('enter In good response scope');
        print(result['body']);
        return false;
      }
    }else{
      //an error occur
      print('enter In error response scope');
      print(result['ErrorCode']);
      print(result['message']);
      return true;
    }

  }
}