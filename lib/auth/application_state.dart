import 'package:ecommerce_shoppers/auth/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum ApplicationLoginState { loggedIn, loggedOut }

class ApplicationState extends ChangeNotifier {
  User? user;
  ApplicationLoginState loginState = ApplicationLoginState.loggedOut;

  ApplicationState() {
    init();
  }

  Future<void> init() async {
    FirebaseAuth.instance.userChanges().listen((userFir) {
      if (userFir != null) {
        loginState = ApplicationLoginState.loggedIn;
        user = userFir;
      } else {
        loginState = ApplicationLoginState.loggedOut;
      }
    notifyListeners();
    });
  }

  Future<void> signIn(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
       // Log the error for debugging purposes
      print('Error during sign-in: ${e.message}');
    }
  }

  Future<void> signUp(String email, String password,
      void Function(FirebaseAuthException e) errorCallBack) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await CommonUtil.backendCall(
          userCredential.user!, CommonUtil.stripeUserCreate);
    } on FirebaseAuthException catch (e) {
      errorCallBack(e);
       // Log the error for debugging purposes
      print('Error during sign-Up: ${e.message}');
    }
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
