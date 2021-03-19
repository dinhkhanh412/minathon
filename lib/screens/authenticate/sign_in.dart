import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minathon/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign In"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: RaisedButton(
          child: Text("Sign In Anon"),
          onPressed: () async {
            await Firebase.initializeApp();
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print("Eroor on sign_in.dart line 30");
            } else {
              print("Sign in");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
