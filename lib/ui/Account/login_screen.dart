import 'package:a_2_z_store/ui/Account/register_screen.dart';
import 'package:a_2_z_store/ui/Account/reset_pass_screen.dart';
import 'package:a_2_z_store/widgets/google_signup_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible;

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
        //  resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: ChangeNotifierProvider<AuthProvider>(
            create: (context) => new AuthProvider(),
            child: Consumer<AuthProvider>(
                builder: (buildContext, googleProvider, _) {
              return Center(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32),
                            ),
                            alignment: Alignment.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 22),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Don't Have An Account? ",
                                  style: TextStyle(fontSize: 14),
                                ),
                                GestureDetector(
                                    child: Text("Sign Up",
                                        style: TextStyle(color: Colors.blue)),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegisterScreen()));
                                    }),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 62.0),
                            child: GoogleSignupButtonWidget(),
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
                                if (value.isEmpty)
                                  return 'Please enter some text';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              obscureText: !_passwordVisible,
                              controller: _passwordController,
                              decoration: InputDecoration(
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
                                  child: Icon(_passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Please enter some text';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                            child: GestureDetector(
                                child: Text("Forgot Password?",
                                    style: TextStyle(color: Colors.blue)),
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => ResetScreen()));
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 22.0),
                            alignment: Alignment.center,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 131),
                                  textStyle: TextStyle(fontSize: 18)),
                              child: Text("Log In"),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  googleProvider.signInWithEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
