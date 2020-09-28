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
import 'truths.dart';


class TruthPage extends StatefulWidget {

  String name;
  List<String> names;

  //contructor enabling passing of name details
  TruthPage({Key key, @required this.name, @required this.names}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TruthPageState(name, names);
  }
}

class _TruthPageState extends State<TruthPage>
    with SingleTickerProviderStateMixin {

  String name;
  List<String> names;
  Color _colorContainer1 = Colors.white;
  Truths truths = new Truths();

  _TruthPageState(String name, List<String> names){
    this.name  = name;
    this.names = names;
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => navigateToSubPage(context),
        child: new Container(
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
                      child: new Text(truths.getTruth()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(names: names)));
  }
}
