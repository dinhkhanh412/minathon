import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:minathon/screens/home/homeScreen.dart';
import 'package:minathon/screens/regisScreen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              Image(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/logo.png?alt=media&token=cbb56374-d04e-4e3a-9c22-325a4fc47675')),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                        )),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(fontSize: 14),
                          hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18.0, fontFamily: "Brand Bold"),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (emailTextEditingController.text.isEmpty) {
                          displayToastMessage("Fill Email", context);
                        } else if (passwordTextEditingController.text.isEmpty) {
                          displayToastMessage("Fill Password", context);
                        } else
                          loginAndAuthenticateUser(context);
                      },
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisScreen();
                              },
                            ),
                          );
                        },
                        child: Text('Create account')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    final User user = (await _auth.signInWithEmailAndPassword(
            email: emailTextEditingController.text, password: passwordTextEditingController.text))
        .user;
    if (user != null)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen(UID: user.uid);
          },
        ),
      );
    else {
      displayToastMessage("Wrong info, please try agian", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
