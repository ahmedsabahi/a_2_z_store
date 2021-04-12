import 'package:a_2_z_store/ui/bottomNavBar/bottomNavBar.dart';
import 'package:a_2_z_store/ui/bottomNavBar/bottomNavBarProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<BottomNavBarProvider>(
        create: (context) => BottomNavBarProvider(),
        child: BottomNavBar(),
      ),
    );
  }
}
