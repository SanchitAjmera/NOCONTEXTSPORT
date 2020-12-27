import 'dart:math';
import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';
import 'questions.dart';
import 'home_page.dart';
import 'dart:async';
import 'dart:io';
import 'TD_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'dare.dart';
import 'truth.dart';
import 'package:page_transition/page_transition.dart';

class QuestionPage extends StatefulWidget {
  String name;
  int option;

  //contructor enabling passing of name details
  QuestionPage({Key key, @required this.name, @required this.option})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionPageState(name, option);
  }
}

class _QuestionPageState extends State<QuestionPage>
    with SingleTickerProviderStateMixin {
  String name;
  int option;
  Questions questions = new Questions();
  List<int> ordering;
  Map<String, bool> question;
  List<Color> _colorContainer = <Color>[
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  List<Color> _colorText = <Color>[
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  static int DELAY = 1;

  double width;
  double height;
  double fontSize;
  double boxSize;
  double sizeRatio = 0.75;

  _QuestionPageState(String name, int option) {
    this.name = name;
    this.option = option;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * sizeRatio;
    height = MediaQuery.of(context).size.height * sizeRatio;
    boxSize = height / 6;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black.withOpacity(0.85),
              Colors.black.withOpacity(0.85)
            ])),
        child: Stack(alignment: Alignment.topCenter, children: <Widget>[
          Positioned(
            width: width,
            height: height / 2,
            top: height / 8,
            child: Center(
              child: Text(
                "Okay " + name + ", " + getQuestion().keys.toList()[0],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: width / 10, color: Colors.white),
              ),
            ),
          ),
          showQuestion(0),
          showQuestion(1),
          showQuestion(2),
        ]),
      ),
    );
  }

  Widget showQuestion(int n) {
    return Positioned(
      width: width,
      height: boxSize,
      top: ((height / 2) - 15) + (n + 1) * (boxSize + 15),
      child: InkWell(
        child: Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
            color: _colorContainer[n],
          ),
          width: width,
          child: Center(
            child: Text(getQuestion().keys.toList()[getOrdering()[n]],
                style: TextStyle(
                    fontSize: width /
                        (getQuestion().keys.toList()[getOrdering()[n]].length *
                            0.7),
                    color: _colorText[n]),
                textAlign: TextAlign.center),
          ),
        ),
        onTap: () {
          bool res = question.values.toList()[getOrdering()[n]];
          setState(() {
            _colorContainer[n] = res ? Colors.green : Colors.red;
            _colorText[n] = Colors.white;
          });
          if (res) {
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
    );
  }

  Map<String, bool> getQuestion() {
    if (question == null) {
      question = questions.getQuestion(option);
    }
    return question;
  }

  List<int> getOrdering() {
    if (ordering == null) {
      ordering = questions.getOrdering();
    }
    return ordering;
  }

  int truthOrDare() {
    return (Random().nextDouble()).round();
  }

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 1), () => "1");
  }

  Future navigateToTDPage(context) async {
    int forfeit = truthOrDare();
    if (forfeit == 1) {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRight, child: Dare(name: name)));
      //Navigator.push(context, MaterialPageRoute(builder: (context) => TDPage(name: name, forfeit : forfeit)));
    } else {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft, child: Truth(name: name)));
    }
  }
}
