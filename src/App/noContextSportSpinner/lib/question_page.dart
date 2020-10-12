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
import 'package:animated_text_kit/animated_text_kit.dart';

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

  Color _colorText1 = Colors.black;
  Color _colorText2 = Colors.black;
  Color _colorText3 = Colors.black;

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
                colors: [Colors.purple.withOpacity(1), Colors.pink.withOpacity(1)])),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              width: 350,
              height: 200,
              top: 120,
              child: Center(
                  child: Text(
                    "Okay " + name + ", " + getQuestion().keys.toList()[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
            ),
            Positioned(
              width: 400,
              height: 120,
              top: 320,
              child: new AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: InkWell(
                  child: Container(
                    width: 400,
                    color: _colorContainer1,
                    child: Center(
                      child: Text(
                        getQuestion().keys.toList()[getOrdering()[0]],
                        style: TextStyle(fontSize: 30, color: _colorText1),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  onTap: () {
                    bool res = question.values.toList()[getOrdering()[0]];
                    setState(() {
                      _colorContainer1 = res ? Colors.green : Colors.red;
                      _colorText1 = Colors.white;
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
              ),
            ),
            Positioned(
              width: 400,
              height: 120,
              top: 420,
              child: new AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: InkWell(
                  child: Container(
                    width: 400,
                    color: _colorContainer2,
                    child: Center(
                      child: Text(
                        getQuestion().keys.toList()[getOrdering()[1]],
                        style: TextStyle(fontSize: 30, color: _colorText2),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  onTap: () {
                    bool res = question.values.toList()[getOrdering()[1]];
                    setState(() {
                      _colorContainer2 = res ? Colors.green : Colors.red;
                      _colorText2 = Colors.white;
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
              ),
            ),
            Positioned(
              width: 400,
              height: 120,
              top: 520,
              child: new AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: InkWell(
                  child: Container(
                    width: 400,
                    color: _colorContainer3,
                    child: Center(
                      child: Text(
                        getQuestion().keys.toList()[getOrdering()[2]],
                        style: TextStyle(fontSize: 30, color: _colorText3),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  onTap: () {
                    bool res = question.values.toList()[getOrdering()[2]];
                    setState(() {
                      _colorContainer3 = res ? Colors.green : Colors.red;
                      _colorText3 = Colors.white;
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
              ),
            )
          ]
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

class ShakeTransition extends StatelessWidget {
  const ShakeTransition({
    Key key,
    this.duration = const Duration(milliseconds: 900),
    this.offset = 140.0,
    this.axis = Axis.horizontal,
    @required this.child
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context){
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.elasticOut,
      tween : Tween(begin: 1, end: 0),
      builder : ( context, value, child){
        return Transform.translate(
          offset: axis == Axis.horizontal
            ? Offset(
              value+offset,
              0.0,
              )
            : Offset(
              0.0,
              value+offset,
            ),
        child: child,
        );
      },
    );
  }
}
