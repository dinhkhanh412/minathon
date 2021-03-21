import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minathon/screens/home/homeScreen.dart';
import 'package:minathon/screens/loginScreen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String descript;
  final String trendID;
  final String coverImg;
  final imageLink;
  final int vote;
  int like;
  int dislike;
  final likeList;
  final dislikeList;
  final String UID;
  DetailScreen(
      {this.name,
      this.descript,
      this.trendID,
      this.coverImg,
      this.imageLink,
      this.vote,
      this.like,
      this.dislike,
      this.likeList,
      this.dislikeList,
      this.UID});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void clickLikeButton() {
    if (widget.UID == null)
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    else {
      setState(() {
        widget.like = widget.like + 1;
      });
    }
  }

  void clickDisLikeButton() {
    if (widget.UID == null)
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    else {
      setState(() {
        widget.dislike = widget.dislike + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(
      children: <Widget>[
        Container(
            height: 330,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor("#343a40"),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                      new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  image: NetworkImage(widget.coverImg),
                )),
            child: Column(children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.clear, size: 40),
                      color: HexColor("#0081a7"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeScreen(UID: widget.UID)));
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        size: 40,
                      ),
                      color: HexColor("#0081a7"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    widget.name,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(fontSize: 30, color: HexColor("#edf2f4"))),
                  )),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 90,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: widget.like / (widget.like + widget.dislike),
                  leading: new Text("Rate:   ",
                      style: TextStyle(
                          color: HexColor("#0466c8"), fontSize: 16, fontWeight: FontWeight.bold)),
                  center: Text(
                      (widget.like / (widget.like + widget.dislike) * 100).toStringAsFixed(2),
                      style: TextStyle(
                          color: HexColor("#1d3557"), fontSize: 16, fontWeight: FontWeight.bold)),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
                ),
              ),
            ])),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                widget.descript,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                  fontSize: 18,
                  color: HexColor("#212529"),
                )),
                textAlign: TextAlign.justify,
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Image(
                image: NetworkImage(widget.imageLink[0]),
              )),
        ])

            //_categoryRow("Content"),
            ),
        SizedBox(height: 20),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(children: [
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      color: HexColor("#0081a7"),
                      onPressed: () {
                        clickLikeButton();
                      },
                    ),
                    Text(widget.like.toString()),
                  ]),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                    ),
                    Text(widget.dislike.toString()),
                    IconButton(
                      icon: const Icon(Icons.thumb_down),
                      color: HexColor("#0081a7"),
                      onPressed: () {
                        clickDisLikeButton();
                      },
                    ),
                  ]),
                ),
              ],
            )),
        SizedBox(height: 20),
      ],
    ))));
  }
}
