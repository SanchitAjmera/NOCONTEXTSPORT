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
  TDPage({Key key, @required this.name, @required this.forfeit}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TDPageState(name, forfeit);
  }
}

class _TDPageState extends State<TDPage>
    with SingleTickerProviderStateMixin {

  _TDPageState(String name, int forfeit){
    this.name  = name;
    this.forfeit = forfeit;
  }
  String name;
  int forfeit;
  Color _colorContainer1 = Colors.white;
  Color _background;


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    this._background = forfeit != 1 ? Colors.green : Colors.red;
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => navigateToSubPage(context),
        child: new Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_background.withOpacity(1), _background.withOpacity(1)])),
          child: Center(
            child: new AlertDialog(
              contentPadding: EdgeInsets.all(20),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      width: 300,
                //      height: 70,
                      color: _colorContainer1,
                      child: Center(
                        child: Text(
                          truthOrDare(),
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center
                        ),
                      ),
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
    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(names: names)));
  }
}
