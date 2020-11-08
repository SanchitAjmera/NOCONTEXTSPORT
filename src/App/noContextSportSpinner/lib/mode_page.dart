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

class ModePage extends StatefulWidget {
  List<String> names;

  //contructor enabling passing of name details
  ModePage({Key key, @required this.names}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ModePageState(names: names);
  }
}

class _ModePageState extends State<ModePage> {
  List<String> names;
  List<double> positions = [50, 210, 370, 530];
  List<Color> optionColors = <Color>[
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  int option;

  _ModePageState({Key key, @required this.names});

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
              colors: [
            Colors.black.withOpacity(0.85),
            Colors.black.withOpacity(0.85),
          ])),
      child: new Stack(alignment: Alignment.topCenter, children: <Widget>[
        setOption(0),
        setOption(1),
        setOption(2),
        setOption(3),
      ]),
    ));
  }

  Widget setOption(int option) {
    return Positioned(
      width: 350.0,
      height: 120.0,
      top: positions[option],
      child: Container(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.white, width: 10)),
          color: optionColors[option],
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(0),
                  //color: Colors.black,
                  width: 100.0,
                  // height: 190.0,
                  child: (Text(
                    "Image 1",
                  )),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  width: 100.0,
                  child: (Text(
                    "Option 1, details, price",
                  )),
                ),
              ]),
          onPressed: () {
            setState(() {
              this.option = option;
              navigateToSubPage(context);
            });
          },
        ),
      ),
    );
  }

  Future navigateToSubPage(context) async {
    List<String> n2 = names;
    //names = [];
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(names: n2, option: option)));
  }
}
