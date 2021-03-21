import 'dart:convert';
import 'dart:core';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:minathon/screens/detailScreen.dart';
import 'package:minathon/screens/loginScreen.dart';
import 'package:minathon/screens/postScreen.dart';

// import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:minathon/widgets/infoCard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_screen/responsive_screen.dart';

final databaseReference = FirebaseDatabase.instance.reference();
final _trendRef = databaseReference.child('trendList');

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

void createData() {
  databaseReference.child("trendList").set([
    {
      "name": "Đưa tay đây nào, mãi bên nhau bạn nhé",
      "descript":
          "Câu nói tạo nên trend mãi bên nhau bạn nhé chính là một câu hát lời Việt được các bạn trẻ viết lại trên nền nhạc ca khúc Wip Wup của Thái Lan. Một đoạn nhạc ngắn trong bài hát này được cải biên lại với tiết tấu sôi động và cuốn hút hơn. Với các bạn thường xuyên lướt Tik Tok chắc hẳn không ít lần nghe thấy đoạn nhạc này và nhún nhảy theo nó.",
      "trendID": "123",
      "coverImg":
          "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/amee_tbdk.jpg?alt=media&token=d91da307-0273-45cd-858e-8c8db9973fa4",
      "imageLink": [
        "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/unnamed.jpg?alt=media&token=544cbda4-61a6-49a9-bf73-841acc4491e9"
      ],
      "like": 90,
      "dislike": 10
    },
    {
      "name": "Huấn",
      "descript": "Không làm đòi có ăn",
      "coverImg":
          "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/amee_tbdk.jpg?alt=media&token=d91da307-0273-45cd-858e-8c8db9973fa4",
      "imageLink": [
        "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/unnamed.jpg?alt=media&token=544cbda4-61a6-49a9-bf73-841acc4491e9"
      ],
      "like": 90,
      "dislike": 10
    },
    {
      "name": "Huấn",
      "descript": "Không làm đòi có ăn",
      "trendID": "125",
      "coverImg":
          "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/amee_tbdk.jpg?alt=media&token=d91da307-0273-45cd-858e-8c8db9973fa4",
      "imageLink": [
        "https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/unnamed.jpg?alt=media&token=544cbda4-61a6-49a9-bf73-841acc4491e9"
      ],
      "like": 90,
      "dislike": 10
    }
  ]);
}

class HomeScreen extends StatefulWidget {
  final String UID;
  HomeScreen({Key key, this.UID}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool login = true;

  void _onItemTapped(int index) {
    setState(() {
      //createData();
      //_selectedIndex = index;
    });
  }

  loginButton() {}

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
                // controller: TextEditingController( text: locations[0]),
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
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      name: snapshot.value['name'],
                                      descript: snapshot.value['descript'],
                                      trendID: snapshot.value['trendID'],
                                      coverImg: snapshot.value['coverImg'],
                                      imageLink: snapshot.value['imageLink'],
                                      vote: snapshot.value['vote'],
                                      like: snapshot.value['like'],
                                      dislike: snapshot.value['dislike'],
                                      likeList: snapshot.value['likeList'],
                                      dislikeList: snapshot.value['dislikeList'],
                                      UID: widget.UID,
                                    )));
                      },
                      child: InfoCard(
                          name: snapshot.value['name'],
                          descript: snapshot.value['descript'],
                          trendID: snapshot.value['trendID'],
                          coverImg: snapshot.value['coverImg'],
                          vote: snapshot.value['vote']));
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
            if (widget.UID == null)
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            else
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PostScreen(UID: widget.UID)));
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
