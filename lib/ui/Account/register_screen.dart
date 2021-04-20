import 'package:a_2_z_store/ui/Account/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
      body: ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(
          builder: (buildContext, googleProvider, _) {
            return Center(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          alignment: Alignment.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Already Have An Account ",
                                style: TextStyle(fontSize: 14),
                              ),
                              GestureDetector(
                                  child: Text("Log In",
                                      style: TextStyle(color: Colors.blue)),
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _displayName,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "UserName"),
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
                                labelText: "Email"),
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
                            controller: _passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
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
                                child: Icon(_passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                            validator: (String emailValue) {
                              if (emailValue.isEmpty) {
                                return 'This field is mandatory';
                              }

                              String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                                  "\\@" +
                                  "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                                  "(" +
                                  "\\." +
                                  "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                                  ")+";
                              RegExp regExp = new RegExp(p);

                              if (regExp.hasMatch(emailValue)) {
                                // So, the email is valid
                                return null;
                              }

                              return 'This is not a valid email';
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 131),
                                  textStyle: TextStyle(fontSize: 18)),
                              child: Text("Sign Up"),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  googleProvider.registerAccount(
                                      _emailController.text,
                                      _passwordController.text);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
