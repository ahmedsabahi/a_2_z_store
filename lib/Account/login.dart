
import 'package:a_2_z_store/Account/register.dart';
import 'package:a_2_z_store/Account/reset_pass.dart';
import 'package:a_2_z_store/widgets/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false ;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      key: _scaffoldKey,
        body: Center(
          child: Form(
                key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: const Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                        alignment: Alignment.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16,16,16,54),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                          "Don't Have An Account? ",
                          style: TextStyle( fontSize: 14),
                         ),
                          GestureDetector(
                            child: Text("Sign Up", style: TextStyle( color: Colors.blue)),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => RegisterScreen()));
                          }
                         ),
                          ],
                        ),
                      ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration:  InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
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
                          validator: (value) {
                            if (value.isEmpty) return 'Please enter some text';
                            return null;
                          },
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                      child: GestureDetector(
                          child: Text("Forgot Password?", style: TextStyle( color: Colors.blue)),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => ResetScreen()));
                          }
                      ),
                  ),
                      Container(

                        padding: const EdgeInsets.only(top: 22.0),
                        alignment: Alignment.center,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.black,
                              padding:   EdgeInsets.symmetric(vertical: 16, horizontal: 131),
                              textStyle: TextStyle(fontSize: 18)),
                          child: Text("Log In"),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _signInWithEmailAndPassword();
                            }
                          },
                        ),
                      ),
                    ],
                ),
              ),
                ),
          ),
        ),
      );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _toastInfo('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _toastInfo('Wrong password provided for that user.');
      }
    }
  }
  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green);
  }
  void _signOut() async {
    await _auth.signOut();
  }
}