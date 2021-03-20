import 'dart:convert';
import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minathon/screens/loginScreen.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:minathon/widgets/infoCard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

final databaseReference = FirebaseDatabase.instance.reference();

class Trend {
  final String name;
  final String decript;
  final String trendID;
  final String imageLink;
  final int vote;

  Trend({
    this.name,
    this.decript,
    this.trendID,
    this.imageLink,
    this.vote,
  });
}

List trendList;

void updateData() {
  databaseReference.child('trendList').update({
    '1': {
      "name": "Huấn",
      "decript": "Không làm đòi có ăn",
      "trendID": "123",
      "imageLink": "http://www.allwhitebackground.com/images/2/2582-190x190.jpg",
      "vote": 50
    }
  });
}

readData() async {
  await databaseReference.once().then((DataSnapshot snapshot) {
    //print(snapshot.value['trendList']);
    return snapshot.value['trendList'];
  });
}

getMethod() async {
  String url = "https://phuidatabase.000webhostapp.com/getProjectData.php";
  var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  var body = json.decode(res.body);
  return body;
}

void createData() {
  databaseReference.child("trendList").set([
    {
      "name": "Huấn",
      "decript": "Không làm đòi có ăn",
      "trendID": "123",
      "imageLink": "http://www.allwhitebackground.com/images/2/2582-190x190.jpg",
      "vote": 50
    },
    {
      "name": "Huấn",
      "decript": "Không làm đòi có ăn",
      "trendID": "123",
      "imageLink": "http://www.allwhitebackground.com/images/2/2582-190x190.jpg",
      "vote": 50
    },
    {
      "name": "Huấn",
      "decript": "Không làm đòi có ăn",
      "trendID": "123",
      "imageLink": "http://www.allwhitebackground.com/images/2/2582-190x190.jpg",
      "vote": 50
    }
  ]);
}

Widget futureBuilder() {
  return FutureBuilder<dynamic>(
    future: databaseReference.once(),
    builder: (context, snapshot) {
      debugPrint('Builder');
      switch (snapshot.connectionState) {
        case ConnectionState.done:
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          else
            return buildDic(context, 1, trendList);
          break;

        default:
          debugPrint("Snapshot " + snapshot.toString());
          return Container(); // also check your listWidget(snapshot) as it may return null.
      }
    },
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final Future<FirebaseApp> _future = Firebase.initializeApp();

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  //String userID = null;
  bool login = true;

  void _onItemTapped(int index) {
    setState(() {
      print("a");
      //createData();
      //_selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (trendList != null) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: trendList.length,
            itemBuilder: (context, index) {
              return buildDic(context, index, trendList);
            },
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        trendList = snapshot.data;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: trendList.length,
          itemBuilder: (context, index) {
            return buildDic(context, index, trendList);
          },
        );
      },
    ),

    // FutureBuilder(builder: builder),
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            InfoCard(
                name: "Bug",
                decript: "Khônh làm mà đòi có ăn",
                trendID: "123",
                imageLink: 'http://www.allwhitebackground.com/images/2/2582-190x190.jpg',
                vote: 50),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: readData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              print('errro');
              return Text(snapshot.error.toString());
            } else {
              print(snapshot.data);
            }
            return Container();
          }),
      // child: _widgetOptions.elementAt(_selectedIndex),
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
          onPressed: () async {
            await readData();
          },
          tooltip: 'Add trend',
          child: const Icon(Icons.add),
        ),
        visible: login,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget buildDic(BuildContext context, int index, List dicList) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Text(dicList[index]['name'], style: Theme.of(context).textTheme.headline1),
      decoration: BoxDecoration(
        color: const Color(0xff7c94b6),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: NetworkImage(dicList[index]['imageLink']),
        ),
      ),
    ),
  );
}
