

import 'package:a_2_z_store/Account/login.dart';
import 'package:a_2_z_store/Account/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<RegisterScreen>{
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false ;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
            key: _formKey,
              child:SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      alignment: Alignment.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16,16,16,48),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Already Have An Account ",
                            style: TextStyle( fontSize: 14),
                          ),
                          GestureDetector(
                              child: Text("Log In", style: TextStyle( color: Colors.blue)),
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => SignIn()));
                              }
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _displayName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "UserName"
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email"
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: !_passwordVisible,
                      decoration:  InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        suffixIcon: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              _passwordVisible = true;
                            });
                          },
                          onLongPressUp: () {
                            setState(() {
                              _passwordVisible = false;
                            });
                          },
                          child: Icon(
                              _passwordVisible ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black,
                            padding:   EdgeInsets.symmetric(vertical: 16, horizontal: 131),
                            textStyle: TextStyle(fontSize: 18)),
                        child: Text("Sign Up"),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _registerAccount();
                                }
                              }
                      ),
                    ),
                  ],
                ),
            )),
        ),
      ),
    );
  }

  void _registerAccount() async {
    try {
     await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((_){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => VerifyEmail()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _toastInfo('The password provided is too weak.');
      }  else if (e.code == 'email-already-in-use') {
        _toastInfo('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green);
  }
}