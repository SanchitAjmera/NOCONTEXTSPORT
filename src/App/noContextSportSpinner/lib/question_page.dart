import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';
import 'questions.dart';

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
            contentPadding: EdgeInsets.all(0.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 300,
                  height: 200,
                  child: new Text(getQuestion().keys.toList()[0]),
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    color: _colorContainer1,
                    child: new Text(getQuestion().keys.toList()[getOrdering()[0]]),
                  ),
                  onTap: () {
                    setState(() {
                      _colorContainer1 = question.values.toList()[getOrdering()[0]] ?
                            Colors.green :
                            Colors.red;
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    color: _colorContainer2,
                    child: new Text(getQuestion().keys.toList()[getOrdering()[1]]),
                  ),
                  onTap: () {
                    setState(() {
                      _colorContainer2 = question.values.toList()[getOrdering()[1]] ?
                            Colors.green :
                            Colors.red;
                    });
                  },
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    color: _colorContainer3,
                    child: new Text(getQuestion().keys.toList()[getOrdering()[2]]),
                  ),
                  onTap: () {
                    setState(() {
                      _colorContainer3 = question.values.toList()[getOrdering()[2]] ?
                            Colors.green :
                            Colors.red;
                    });
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
}
