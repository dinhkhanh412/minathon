import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String decript;
  final String trendID;
  final String imageLink;
  final int vote;
  const InfoCard({
    Key key,
    @required this.name,
    @required this.decript,
    @required this.trendID,
    @required this.imageLink,
    @required this.vote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Text(this.name, style: Theme.of(context).textTheme.headline1),
        decoration: BoxDecoration(
          color: const Color(0xff7c94b6),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: NetworkImage('http://www.allwhitebackground.com/images/2/2582-190x190.jpg'),
          ),
        ),
      ),
    );
  }
}
