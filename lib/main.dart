import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:minathon/screens/wrapper.dart';
=======
import 'package:minathon/screens/detailScreen.dart';
import 'package:minathon/screens/home/homeScreen.dart';
>>>>>>> e0e09807b95070391ee484cf19830276ff033c82
import 'package:minathon/screens/regisScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("user");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DetailScreen(),
    );
  }
}
