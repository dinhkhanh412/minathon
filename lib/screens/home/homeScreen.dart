import 'dart:async';

import 'package:minathon/theme/color/light_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minathon/widgets/infoCard.dart';
import 'package:responsive_screen/responsive_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          InfoCard(
              cardTitle: "Title",
              caseTitle: "Case",
              currentData: 10,
              newData: 12,
              percentChange: 50,
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              color: Colors.blue[20])
        ],
      ),
    ));
  }
}
