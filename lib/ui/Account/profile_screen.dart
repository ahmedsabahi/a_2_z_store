import 'dart:async';

import 'package:a_2_z_store/ui/Account/auth_provider.dart';
import 'package:a_2_z_store/ui/Account/login_screen.dart';
import 'package:a_2_z_store/widgets/profle_wedgit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 100), (timer) {
      Center(child: CircularProgressIndicator());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => AuthProvider(),
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final provider = Provider.of<AuthProvider>(context);
                if (provider.isSigningIn) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return ProfileWidget();
                } else if (snapshot.hasError) {
                  return Text('Error Firebase');
                }
                return LoginScreen();
              }),
        ),
      );
}
