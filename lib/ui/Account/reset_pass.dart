import 'package:a_2_z_store/ui/Account/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String _email = _emailController.text;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(42.0),
              child: Container(
                child: const Text(
                  'Reset Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
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
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                    textStyle: TextStyle(fontSize: 18)),
                child: Text("Submit"),
                onPressed: () {
                  _showMyDialog();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: GestureDetector(
                  child: Text("Return to Log In? ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue)),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        String _email = _emailController.text;
        return AlertDialog(
          title: Text('Done'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('A Password reset link has been sent to $_email'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
