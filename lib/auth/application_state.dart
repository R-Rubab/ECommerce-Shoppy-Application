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
        user = userFir;
        loginState = ApplicationLoginState.loggedIn;
      } else {
        loginState = ApplicationLoginState.loggedOut;
      }
    });
    notifyListeners();
  }

  Future<void> signIn(String email, String password,
      void Function(FirebaseAuthException e)errorCallBack ) async {
        try{
          await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        }on FirebaseAuthException catch(error){
          errorCallBack(error);
        }
      }

  Future<void> signUp(String email, String password,
      void Function(FirebaseAuthException e)errorCallBack ) async {
        try{
          UserCredential userCredential =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        }on FirebaseAuthException catch(error){
          errorCallBack(error);
        }
      }

      void signOut()async{
  await FirebaseAuth.instance.signOut();
}
}



