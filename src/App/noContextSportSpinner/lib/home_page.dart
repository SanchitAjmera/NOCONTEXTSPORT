import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'question_page.dart';
import 'board_view.dart';
import 'model.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  List<String> names;
  int option;

  //contructor enabling passing of name details
  HomePage({Key key, @required this.names, @required this.option})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState(names: names, option: option);
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _current = 0;
  var _value;
  AnimationController _ctrl;
  Animation _ani;
  String name;
  int option;

  List<Luck> _items = [];
  List<String> names;
  List<Color> optionColours = <Color>[
    Colors.black.withOpacity(0.85),
    Colors.black.withOpacity(0.85),
    Colors.black.withOpacity(0.85),
    Colors.black.withOpacity(0.85)
  ];
  double width;
  double height;
  double fontSize;
  double boxSize;
  double sizeRatio = 0.70;

  _HomePageState({Key key, @required this.names, @required this.option});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // time duration of wheel spinning
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);

    int accent = 0;
    for (String name in names) {
      _items.add(Luck(name, Colors.accents[accent]));
      accent += 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [optionColours[option], optionColours[option]])),
        child: AnimatedBuilder(
            animation: _ani,
            builder: (context, child) {
              // value is the future endpoint of the wheel
              _value = _ani.value;
              //print(_value);
              // angle is angle the wheel spins
              final _angle = _value * this._angle;
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  BoardView(items: _items, current: _current, angle: _angle),
                  _buildGo(),
                  _buildResult(_value),
                ],
              );
            }),
      ),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: height / 6,
          width: height / 6,
          child: Text(
            "SPIN",
            style:
                TextStyle(fontSize: height / 17, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
        var _index = _calIndex(_value * _angle + _current);
        navigateToHomePage(context);
      });
    }
  }

  int _calIndex(value) {
    // base is the index of the randomly chosen component
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  // function which outputs results at the bottom of the screen
  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    // items[index] refers to the chosen picture to display
    String _asset = _items[_index].asset;
    name = _asset;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 70.0),
      child: Align(
          alignment: Alignment.bottomCenter,
          child: new Text(
            _asset.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: height / 15,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ) //Image.asset(_asset, height: 80, width: 80),
          ),
    );
  }

  Future navigateToHomePage(context) async {
    var _index = _calIndex(_value * _angle + _current);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => QuestionPage(name: name, option: option)));
  }
}
