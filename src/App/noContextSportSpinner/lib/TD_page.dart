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


class TDPage extends StatefulWidget {

  String name;

  //contructor enabling passing of name details
  TDPage({Key key, @required this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TDPageState(name);
  }
}

class _TDPageState extends State<TDPage>
    with SingleTickerProviderStateMixin {

  String name;
  Color _colorContainer1 = Colors.white;

  _TDPageState(String name){
    this.name  = name;
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
                      child: new Text(truthOrDare()),
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

  String truthOrDare(){
    TD td = new TD();
    var _random = (Random().nextDouble() * 2).round() + 1;
    if (_random == 1) {
      return td.getTruth();
    } else {
      return td.getDare();
    }
  }

  Future navigateToSubPage(context) async {
    Navigator.pop(context);
    Navigator.pop(context);
    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(names: names)));
  }
}
