import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;

  AuthProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  //google login
  Future login() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();
    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      isSigningIn = false;
    }
  }

  // logout
  void logout() async {
    await
    FirebaseAuth.instance.signOut();
  }

  //Email And Password login
  void signInWithEmailAndPassword(String email, String password) async {
    isSigningIn = true;
    if (email.length == 0 || !email.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }
     FirebaseAuth auth = FirebaseAuth.instance;
    // if (auth.currentUser == null) {
      // isSigningIn = false;
      // return;
   //  }else {
       try {
         final User user = (await _auth.signInWithEmailAndPassword(
           email: email,
           password: password,
         ))
             .user;
    if(user != null){
    //UserUpdateInfo updateUser = UserUpdateInfo();
  //  updateUser.displayName = _usernameController.text;
  //  user.updateProfile(updateUser);
  //  Navigator.of(context).pushNamed(AppRoutes.menu);
    }
         if (!user.emailVerified) {
           await user.sendEmailVerification();
         }
       } on FirebaseAuthException catch (e) {
         if (e.code == 'user-not-found') {
           _toastInfo('No user found for that email.');
         } else if (e.code == 'wrong-password') {
           _toastInfo('Wrong password provided for that user.');
         }
       } catch (e) {
         print(e);
       }
     //  isSigningIn = false;
   //  }
  }

  //Email And Password sign up
  void registerAccount(String email, String password) async {
    isSigningIn = true;
    if (email.length == 0 || !email.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }
    // FirebaseAuth auth = FirebaseAuth.instance;
    // if (auth.currentUser == null) {
     //  isSigningIn = false;
   //    return;
   //  }else {
       try {
         await _auth.createUserWithEmailAndPassword(
             email: email, password: password);
       } on FirebaseAuthException catch (e) {
         if (e.code == 'weak-password') {
           _toastInfo('The password provided is too weak.');
         } else if (e.code == 'email-already-in-use') {
           _toastInfo('The account already exists for that email.');
         }
       } catch (e) {
         print(e);
       }
     //  isSigningIn = false;
   //  }
  }

  //reset password
  void resetPassword(String email) async {
    if (email.length == 0 || !email.contains("@")) {
      Fluttertoast.showToast(msg: "Enter valid email");
      return;
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  //toast
  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green);
  }
}
