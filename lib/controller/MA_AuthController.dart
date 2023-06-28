import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_app/controller/MA_DataController.dart';
import 'package:money_app/views/app content/MA_Provider_CheckUser.dart';

import '../views/auth/MA_Login.dart';
import '../views/auth/MA_Signup.dart';
import '../views/homePage/MA_homePage.dart';
import 'Helper classes/MA_Helper_Country.dart';

class AuthController extends GetxController{

  FirebaseAuth auth = FirebaseAuth.instance;
  DataController dataController = Get.put(DataController());

  var isLoading = false.obs;
  void signUp({String? email, String? password}) async{

    isLoading(true);

    auth.createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      isLoading(false);
      ///retrieve Country and cities
       Get.to(()=> SignupView());
      /// Navigate user to profile screen

    }).catchError((e) {
      isLoading(false);
      /// print error information
      print("Error in authentication $e");
    });
  }

  void login({String? email, String? password}){
    print("in the login fonction");
    isLoading(true);

    auth.signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      /// Login Sucess
      isLoading(false);
      ///go to dashboard directly
      Get.to(()=> TransactionListScreen());
    } ).catchError((e) {
      isLoading(false);
      //Get.snackbar('Error',"$e");
      print("Error in authentication $e");

    });

  }

  void forgetPassword(String email) {
    print("********** in the forgetPassword function ***************");
    auth.sendPasswordResetEmail(email: email).then((value) {
      Get.back();
      Get.snackbar('Email Sent', 'We have sent password reset email');
    }).catchError((e) {
      print("Error in sending password reset email is $e");
    });
  }

  void logout(){
      print("********** in the logout function ***************");
      auth.signOut().then((value){
        print("*********  Succesfully logout *******");
        Get.to(()=> LoginView());
      }).catchError((e){
      print("*** Error when Logging Out $e");
      });
  }

  signInWithGoogle() async {
    isLoading(true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      isLoading(false);
      ///SuccessFull loged in
      //Get.to(() => BottomBarView());
      Get.to(()=> AppContent());
    }).catchError((e) {
      /// Error in getting Login
      isLoading(false);
      print("Error is $e");
    });
  }

   signInWithFacebook() async {
     Get.snackbar('Facebook ---> ', 'Content Facebook');
     isLoading(true);
     try{
       final facebookLoginResult = await FacebookAuth.instance.login();
       final userData = await FacebookAuth.instance.getUserData();

       final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
       FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value) {
         isLoading(false);
         Get.to(()=> AppContent());
       }).catchError((e){
         isLoading(false);
         print("Error in the Facebook_signInWithCredential:  $e");
       });

     } on FirebaseAuthException catch (e) {
       print("Error when try to login with facebook is $e");
       var title = '';
          switch(e.code){
            case 'account-exists-with-different-credential':
              title = 'this account exists with a different sign in provider';
              break;
            case 'invalid-credential':
              title = 'Unknown error has occured';
              break;
            case 'operation-not-allowed':
              title = 'This operation is not allowed';
              break;
            case 'user-disabled':
              title = 'The user you tried to log into is disabed';
              break;
            case 'user-not-found':
              title = 'The user you tried to log into was not found';
              break;
          }
       print("Error Title is $title");
       Get.snackbar('Eroor : This error occur ---> ', '$title');
     }
   }

   Future<void> retrieveCountry() async  {
    await  dataController.retrieveCountry();
  }



}