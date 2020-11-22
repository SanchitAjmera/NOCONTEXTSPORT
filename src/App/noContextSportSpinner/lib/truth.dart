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
import 'TD.dart';
import 'TD_page.dart';
import 'package:page_transition/page_transition.dart';

class Truth extends StatefulWidget {
  String name;

  //contructor enabling passing of name details
  Truth({Key key, @required this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TruthState(name);
  }
}

class _TruthState extends State<Truth> with SingleTickerProviderStateMixin {
  String name;
  Color _colorContainer1 = Colors.white;

  _TruthState(String name) {
    this.name = name;
  }

  double width;
  double height;
  double fontSize;
  double boxSize;
  double sizeRatio = 0.70;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () => navigateToTDPage(context));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: new Container(
        width: width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.green.withOpacity(1),
              Colors.green.withOpacity(1)
            ])),
        child: Center(
          child: Text(
            "Truth!",
            style: TextStyle(fontSize: width / 4, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future navigateToTDPage(context) async {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: TDPage(name: name, forfeit: 0)));
  }
}
