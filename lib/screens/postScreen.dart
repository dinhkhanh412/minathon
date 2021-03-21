import 'dart:io';

import 'package:flutter/material.dart';

import 'home/homeScreen.dart';

class PostScreen extends StatelessWidget {
  String _name;
  String _description;
  List<String> _img;
  String _src;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imgController = TextEditingController();
  TextEditingController _srcController = TextEditingController();

  bool _termsChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              SizedBox(height: 40),
              Text(
                "Trend Dictionary",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Create new trend dictionary",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey[400])),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    enabledBorder:
                        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: "Trend Name",
                    labelStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    border: OutlineInputBorder(),
                    hintText: "Không làm mà đòi có ăn",
                    prefixIcon: Icon(Icons.subject)),
                maxLength: 20,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                    enabledBorder:
                        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: "Description",
                    labelStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    border: OutlineInputBorder(),
                    hintText: "Không làm mà đòi có ăn",
                    prefixIcon: Icon(Icons.subject)),
                maxLength: 500,
              ),
              TextField(
                controller: _srcController,
                decoration: InputDecoration(
                    enabledBorder:
                        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: "Source",
                    labelStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                    border: OutlineInputBorder(),
                    hintText: "Link video",
                    prefixIcon: Icon(Icons.subject)),
                maxLength: 500,
              ),
              SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: FlatButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        _name = _nameController.text;
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Text("Submit"))),
            ])));
  }
}
