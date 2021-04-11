import 'dart:async';

import 'package:a_2_z_store/widgets/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return VerifyState();
  }

}
class VerifyState extends State<VerifyEmail>{
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    if (!user.emailVerified) {
       user.sendEmailVerification();
    }


    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
          padding:  const EdgeInsets.symmetric(vertical: 50, horizontal: 32),
          child: Text(
            'An email has been sent to ${user.email} please verify',
           style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),

    );
  }


Future<void> checkEmailVerified() async {
  user = auth.currentUser;
  await user.reload();
  if (user.emailVerified) {
    timer.cancel();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
}