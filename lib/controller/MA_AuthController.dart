import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../views/auth/MA_Signup.dart';

class AuthController extends GetxController{

  FirebaseAuth auth = FirebaseAuth.instance;

  var isLoading = false.obs;
  void signUp({String? email, String? password}){

    isLoading(true);

    auth.createUserWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      isLoading(false);
      /// Navigate user to profile screen
      Get.to(()=> SignupView());
    }).catchError((e) {
      isLoading(false);
      /// print error information
      print("Error in authentication $e");
    });
  }

  void login({String? email, String? password}){

    isLoading(true);

    auth.signInWithEmailAndPassword(email: email!, password: password!)
        .then((value) {
      /// Login Sucess
      isLoading(false);
     // Get.to(()=> HomeScreen());
    } ).catchError((e) {
      isLoading(false);
      Get.snackbar('Error',"$e");
      print("Error in authentication $e");
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
      Get.to(()=> SignupView());
    }).catchError((e) {
      /// Error in getting Login
      isLoading(false);
      print("Error is $e");
    });
  }
}