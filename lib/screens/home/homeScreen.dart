import 'dart:convert';
import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:minathon/screens/loginScreen.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:minathon/widgets/infoCard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

final databaseReference = FirebaseDatabase.instance.reference();
final _trendRef = databaseReference.child('trendList');

class Trend {
  final String name;
  final String descript;
  final String trendID;
  final String imageLink;
  final int vote;

  Trend({
    this.name,
    this.descript,
    this.trendID,
    this.imageLink,
    this.vote,
  });
}

class RecipeTrendList {
  List<Trend> recipeList;

  RecipeTrendList({this.recipeList});
  factory RecipeTrendList.fromJSON(Map<dynamic, dynamic> json) {
    return RecipeTrendList(recipeList: parserecipes(json));
  }
  static List<Trend> parserecipes(recipeJSON) {
    var rList = recipeJSON['browseRecipes'] as List;
  }
}

void updateData() {
  databaseReference.child('trendList').update({
    '1': {
      "name": "Huấn",
      "descript": "Không làm đòi có ăn",
      "trendID": "123",
      "imageLink": "http://www.allwhitebackground.com/images/2/2582-190x190.jpg",
      "vote": 50
    }
  });
}

readData() async {
  await databaseReference.once().then((DataSnapshot snapshot) {
    //print(snapshot.value['trendList']);
    // var a = json.decode(snapshot.value);
    // print(a);
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
      "name": "Đưa tay đây nào, mãi bên nhau bạn nhé",
      "descript":
          "Câu nói tạo nên trend mãi bên nhau bạn nhé chính là một câu hát lời Việt được các bạn trẻ viết lại trên nền nhạc ca khúc Wip Wup của Thái Lan. Một đoạn nhạc ngắn trong bài hát này được cải biên lại với tiết tấu sôi động và cuốn hút hơn. Với các bạn thường xuyên lướt Tik Tok chắc hẳn không ít lần nghe thấy đoạn nhạc này và nhún nhảy theo nó.",
      "trendID": "123",
      "imageLink": [
        "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/amee_tbdk.jpg?alt=media&token=d91da307-0273-45cd-858e-8c8db9973fa4",
        "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/unnamed.jpg?alt=media&token=544cbda4-61a6-49a9-bf73-841acc4491e9"
      ],
      "vote": 50
    },
    {
      "name": "Huấn",
      "descript": "Không làm đòi có ăn",
      "trendID": "124",
      "imageLink": "[http://www.allwhitebackground.com/images/2/2582-190x190.jpg]",
      "vote": 50
    },
    {
      "name": "Huấn",
      "descript": "Không làm đòi có ăn",
      "trendID": "125",
      "imageLink": "[http://www.allwhitebackground.com/images/2/2582-190x190.jpg]",
      "vote": 50
    }
  ]);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

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

  // List<Widget> _widgetOptions = <Widget>[
  //   FutureBuilder(
  //     future: _future,
  //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
  //       if (trendList != null) {
  //         return ListView.builder(
  //           physics: NeverScrollableScrollPhysics(),
  //           itemCount: trendList.length,
  //           itemBuilder: (context, index) {
  //             return buildDic(context, index, trendList);
  //           },
  //         );
  //       }

  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //       trendList = snapshot.data;
  //       return ListView.builder(
  //         physics: NeverScrollableScrollPhysics(),
  //         itemCount: trendList.length,
  //         itemBuilder: (context, index) {
  //           return buildDic(context, index, trendList);
  //         },
  //       );
  //     },
  //   ),

  //   // FutureBuilder(builder: builder),
  //   Scaffold(
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           SizedBox(height: 50),
  //           InfoCard(
  //               name: "Bug",
  //               decript: "Khônh làm mà đòi có ăn",
  //               trendID: "123",
  //               imageLink: 'http://www.allwhitebackground.com/images/2/2582-190x190.jpg',
  //               vote: 50),
  //         ],
  //       ),
  //     ),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                // controller: TextEditingController(text: locations[0]),
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                    prefixIcon: Material(
                      elevation: 0.0,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      child: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          Flexible(
            child: new FirebaseAnimatedList(
                shrinkWrap: true,
                query: _trendRef,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animation, int index) {
                  return new InfoCard(
                      name: snapshot.value['name'],
                      descript: snapshot.value['descript'],
                      trendID: snapshot.value['trendID'],
                      imageLink: snapshot.value['imageLink'],
                      vote: snapshot.value['vote']);
                }),
          ),
        ],
      ),

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
