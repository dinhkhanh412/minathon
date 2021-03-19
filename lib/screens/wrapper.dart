import 'package:minathon/screens/authenticate/authenticate.dart';
//import 'package:minathon/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  static Route<Object> idScreen;

  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget
    return Authenticate();
  }
}
