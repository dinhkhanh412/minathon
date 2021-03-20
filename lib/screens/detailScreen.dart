import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hexcolor/hexcolor.dart';

// import 'package:flutter_smart_course/src/pages/home_page.dart';
// import 'package:flutter_smart_course/src/theme/theme.dart';
enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                child: Column(
      children: <Widget>[
        Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: HexColor("#343a40"),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/amee_tbdk.jpg?alt=media&token=d91da307-0273-45cd-858e-8c8db9973fa4'),
                )),
            child: Column(children: <Widget>[
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.clear, size: 40),
                      color: HexColor("#0081a7"),
                      onPressed: () {},
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
                    "Đưa tay đây nào mãi bên nhau bạn nhé",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 30, color: HexColor("#edf2f4"))),
                  )),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 90,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.9,
                  leading: new Text("Rate:   ",
                      style: TextStyle(
                          color: HexColor("#0466c8"),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  center: Text("90.0%",
                      style: TextStyle(
                          color: HexColor("#1d3557"),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: HexColor("#a8dadc"),
                ),
              ),
            ])),
        SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                "Câu nói tạo nên trend mãi bên nhau bạn nhé chính là một câu hát lời Việt được các bạn trẻ viết lại trên nền nhạc ca khúc Wip Wup của Thái Lan. Một đoạn nhạc ngắn trong bài hát này được cải biên lại với tiết tấu sôi động và cuốn hút hơn. Với các bạn thường xuyên lướt Tik Tok chắc hẳn không ít lần nghe thấy đoạn nhạc này và nhún nhảy theo nó.",
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
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/minathon-ec172.appspot.com/o/amee_tbdk.jpg?alt=media&token=d91da307-0273-45cd-858e-8c8db9973fa4'),
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
                  child: IconButton(
                    icon: const Icon(Icons.thumb_down),
                    color: HexColor("#0081a7"),
                    onPressed: () {},
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.thumb_up),
                    color: HexColor("#0081a7"),
                    onPressed: () {},
                  ),
                ),
              ],
            )),
        SizedBox(height: 20),
      ],
    ))));
  }
}
