import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';

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
  List<Color> optionColors = <Color>[
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List<String> options = [
    "FAMILY FUN",
    "FOR THE LADS",
    "BREAK THE ICE",
    "ADULTS ONLY"
  ];
  List<String> emojis = ["apple.png", "carrot.png", "cheese.png", "grapes.png"];
  List<String> desc = [
    "A great way to bring life back into your boring family events!",
    "The perfect game to play at pre drinks or down the pub with your mates!",
    "The ideal way to settle into a date or for a fun night in with your other half!",
    "The ultimate party game where anything can happen!"
  ];
  int option;
  double width;
  double height;
  double fontSize;
  double boxSize;
  double sizeRatio = 0.70;

  _ModePageState({Key key, @required this.names});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * sizeRatio;
    height = MediaQuery.of(context).size.height * 0.9;
    boxSize = height / 4.5;
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
    double topMargin = height / 8;
    double top = option == 0 ? (topMargin) : option * (boxSize) + topMargin;
    double heading_size = (width / 1.3) / options[option].length;
    return Positioned(
      width: width,
      height: boxSize,
      top: top,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: optionColors[option],
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(width / 30),
                  //color: Colors.black,
                  width: width / 3,
                  // height: 190.0,
                  child: new Image.asset('asset/image/' + emojis[option]),
                ),
                Container(
                  child: ListView(children: <Widget>[
                    Text(
                      options[option],
                      style: TextStyle(fontSize: heading_size),
                    ),
                    Text(
                      desc[option],
                      style: TextStyle(color: Colors.grey[600], fontSize: 11),
                    )
                  ]),
                  padding: EdgeInsets.only(left: (width / 30)),
                  width: ((2 * width) / 3) - 4 * (width / 30),
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
