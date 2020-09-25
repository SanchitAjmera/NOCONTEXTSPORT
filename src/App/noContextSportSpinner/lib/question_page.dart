import 'dart:math';

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
                colors: [Colors.green, Colors.blue.withOpacity(0.2)])),
        child: Center(
          child: new AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(

                  width: 150.0,
                  child: new TextField(
                    decoration: new InputDecoration.collapsed(hintText: name),
                    maxLines: 1,
                    onSubmitted: (String text){
                    }
                  ),
                ),
                Container(
                  width: 150.0,
                  child: new TextField(
                    decoration: new InputDecoration.collapsed(hintText: name),
                    maxLines: 1,
                    onSubmitted: (String text){
                    }
                  ),
                ),
                Container(
                  width: 150.0,
                  child: new TextField(
                    decoration: new InputDecoration.collapsed(hintText: name),
                    maxLines: 1,
                    onSubmitted: (String text){
                    }
                  ),
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
