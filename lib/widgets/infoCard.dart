import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String descript;
  final String trendID;
  final String coverImg;
  final int vote;
  const InfoCard({
    Key key,
    @required this.name,
    @required this.descript,
    @required this.trendID,
    @required this.coverImg,
    @required this.vote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List colors = [
      HexColor("#cb2924"),
      HexColor("#d49068"),
      HexColor("#888b90"),
      HexColor("#5a8c83"),
      HexColor("#8da9d0")
    ];
    var fillColor = colors[(new Random()).nextInt(colors.length)];
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      this.name,
                      style: GoogleFonts.lato(fontSize: 30, color: HexColor("#f8f9fa")),
                      textAlign: TextAlign.center,
                    ))),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(fillColor.withOpacity(0.8), BlendMode.srcOver),
                image: NetworkImage(this.coverImg),
              ),
            ),
          )),
    ]);
  }
}
