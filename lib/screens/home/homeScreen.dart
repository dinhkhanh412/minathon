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
  int _selectedIndex = 0;
  String userID = null;
  bool login = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      login = !login;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            InfoCard(
              cardTitle: "Title",
              caseTitle: "Case",
              currentData: 10,
              newData: 12,
              percentChange: 100,
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              color: Colors.blue[20],
              cardColor: Colors.blue[400],
            )
          ],
        ),
      ),
    ),
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            InfoCard(
              cardTitle: "Title",
              caseTitle: "Case",
              currentData: 10,
              newData: 12,
              percentChange: 100,
              icon: Icon(
                Icons.favorite,
                color: Colors.blue,
              ),
              color: Colors.red,
              cardColor: Colors.green,
            )
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Trend Unsafe',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: Visibility(
        child: FloatingActionButton(
          onPressed: () => setState(() {}),
          tooltip: 'Add trend',
          child: const Icon(Icons.add),
        ),
        visible: login,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
