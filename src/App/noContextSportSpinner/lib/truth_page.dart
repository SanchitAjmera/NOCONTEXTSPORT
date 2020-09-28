import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';
import 'questions.dart';
import 'home_page.dart';
import 'dart:async';
import 'dart:io';
import 'question_page.dart';


class TruthPage extends StatefulWidget {

  String name;

  //contructor enabling passing of name details
  TruthPage({Key key, @required this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TruthPageState(name);
  }
}

class _TruthPageState extends State<TruthPage>
    with SingleTickerProviderStateMixin {

  String name;
  Color _colorContainer1 = Colors.white;

  _TruthPageState(String name){
    this.name  = name;
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.pinkAccent[400].withOpacity(0.8), Colors.deepOrangeAccent[400].withOpacity(0.7)])),
        child: Center(
          child: new AlertDialog(
            contentPadding: EdgeInsets.all(0.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    color: _colorContainer1,
                    child: new Text("getQuestion().keys.toList()[getOrdering()[0]]"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
