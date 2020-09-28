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
import 'TD_page.dart';

class QuestionPage extends StatefulWidget {

  String name;

  //contructor enabling passing of name details
  QuestionPage({Key key, @required this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionPageState(name);
  }
}

class _QuestionPageState extends State<QuestionPage>
    with SingleTickerProviderStateMixin {

  String name;
  Questions questions = new Questions();
  List<int> ordering = null;
  Map<String, bool> question = null;
  Color _colorContainer1 = Colors.white;
  Color _colorContainer2 = Colors.white;
  Color _colorContainer3 = Colors.white;

  static int DELAY = 1;

  _QuestionPageState(String name){
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
            contentPadding: EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 200,
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      getQuestion().keys.toList()[0],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    color: _colorContainer1,
                    child: Center(
                      child: Text(
                        getQuestion().keys.toList()[getOrdering()[0]],
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  onTap: () {
                    bool res = question.values.toList()[getOrdering()[0]];
                    setState(() {
                      _colorContainer1 = res ? Colors.green : Colors.red;
                    });
                    if (res){
                      Future.delayed(Duration(seconds: DELAY), () {
                        Navigator.pop(context);
                      });
                    } else {
                      Future.delayed(Duration(seconds: DELAY), () {
                        navigateToTDPage(context);
                      });
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    color: _colorContainer2,
                    child: Center(
                      child: Text(
                        getQuestion().keys.toList()[getOrdering()[1]],
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  onTap: () {
                    bool res = question.values.toList()[getOrdering()[1]];
                    setState(() {
                      _colorContainer2 = res ? Colors.green : Colors.red;
                    });
                    if (res){
                      Future.delayed(Duration(seconds: DELAY), () {
                        Navigator.pop(context);
                      });
                    } else {
                      Future.delayed(Duration(seconds: DELAY), () {
                        navigateToTDPage(context);
                      });
                    }
                  },
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    color: _colorContainer3,
                    child: Center(
                      child: Text(
                        getQuestion().keys.toList()[getOrdering()[2]],
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  onTap: () {
                    bool res = question.values.toList()[getOrdering()[2]];
                    setState(() {
                      _colorContainer3 = res ? Colors.green : Colors.red;
                    });
                    if (res){
                      Future.delayed(Duration(seconds: DELAY), () {
                        Navigator.pop(context);
                      });
                    } else {
                      Future.delayed(Duration(seconds: DELAY), () {
                        navigateToTDPage(context);
                      });
                    }
                  },
                ),
              ]
            )
          ),
        ),
      ),
    );
  }

  Map<String, bool> getQuestion(){
    if (question == null){
      question = questions.getQuestion();
    }
    return question;
  }

  List<int> getOrdering(){
    if (ordering == null){
      ordering = questions.getOrdering();
    }
    return ordering;
  }

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 1), () => "1");
  }

  Future navigateToTDPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TDPage(name: name)));
  }
}
