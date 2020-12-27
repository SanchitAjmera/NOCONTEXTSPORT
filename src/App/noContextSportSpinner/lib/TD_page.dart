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
  int forfeit;

  //contructor enabling passing of name details
  TDPage({Key key, @required this.name, @required this.forfeit})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TDPageState(name, forfeit);
  }
}

class _TDPageState extends State<TDPage> with SingleTickerProviderStateMixin {
  _TDPageState(String name, int forfeit) {
    this.name = name;
    this.forfeit = forfeit;
  }
  String name;
  int forfeit;
  Color _colorContainer1 = Colors.white;
  Color _background;
  double width;
  double height;
  double sizeRatio = 0.8;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * sizeRatio;
    height = MediaQuery.of(context).size.height * sizeRatio;
    this._background = forfeit != 1 ? Colors.blue : Colors.red;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => navigateToSubPage(context),
        child: new Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                _background.withOpacity(1),
                _background.withOpacity(1)
              ])),
          child: Center(
            child: Container(
              width: width,
              child: Text(truthOrDare(),
                  style: TextStyle(fontSize: width / 9, color: Colors.white),
                  textAlign: TextAlign.center),
            ),
          ),
        ),
      ),
    );
  }

  String truthOrDare() {
    TD td = new TD();
    var _random = (Random().nextDouble() * 2).round() + 1;
    if (forfeit != 1) {
      return td.getTruth();
    } else {
      return td.getDare();
    }
  }

  Future navigateToSubPage(context) async {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
