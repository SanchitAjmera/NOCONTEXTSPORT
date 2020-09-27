import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';

class QuestionPage extends StatefulWidget {

  String name;

  //contructor enabling passing of name details
  QuestionPage({Key key, @required this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionPageState(name: name);
  }
}

class _QuestionPageState extends State<QuestionPage>
    with SingleTickerProviderStateMixin {

  String name;
  HashMap

  _QuestionPageState({Key key, @required this.name});

  @override
  void initState() {
    // TODO: implement initState
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
                  child: new Text("question"),
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    child: new Text(name),
                  ),
                  onTap: () {print("Tapped container 1");},
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    child: new Text(name),
                  ),
                  onTap: () {print("Tapped container 1");},
                ),
                InkWell(
                  child: Container(
                    width: 300,
                    height: 70,
                    child: new Text(name),
                  ),
                  onTap: () {print("Tapped container 1");},
                ),
              ]
            )

          //   content: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //         width: 150.0,
          //         child: new TextField(
          //           decoration: new InputDecoration.collapsed(hintText: name),
          //           maxLines: 1,
          //           onSubmitted: (String text){
          //           }
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          ),
        ),
      ),
    );
  }
}
