import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

import 'mode_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOCONTEXTSPORT',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Schyler'),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _splashPageState createState() => _splashPageState();
}

class StartPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _splashPageState extends State<SplashPage> {
  double width;
  double height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => navigateToWarningPage(context));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * 0.80;
    height = MediaQuery.of(context).size.height * 0.80;
    return Scaffold(
        //  resizeToAvoidBottomInset: false,
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => navigateToWarningPage(context),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black.withOpacity(1),
              Colors.black.withOpacity(1)
            ])),
        child: new Stack(alignment: Alignment.center, children: <Widget>[
          Positioned(
            width: width, //350.0,
            top: (height / 2),
            child: Container(
              child: Center(
                child: new Image.asset('asset/image/logo1.jpg'),
              ),
            ),
          ),
        ]),
      ),
    ));
  }

  Future navigateToWarningPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WarningPage()));
  }
}

class _mainPageState extends State<StartPage> {
  // collection of names inputed by player
  List<String> names = [];
  List<Widget> _listings = [];
  int count = 0;
  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;
  double width;
  double height;
  double font_size;
  double font_play;
  double sizeRatio = 0.7;
  double boxHeight;
  double nameHeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * sizeRatio;
    height = MediaQuery.of(context).size.height * sizeRatio;
    font_size = width / 10;
    font_play = width / 6;
    boxHeight = height / 7;
    nameHeight = boxHeight / 1.8;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.black.withOpacity(0.85),
              Colors.black.withOpacity(0.85)
            ])),
        child: new Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              width: width, //300.0,
              height: 4 * nameHeight + 40,
              top: height / 5,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          for (var i in names) showName(i),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ENTER NAME BOX
            Positioned(
              width: width,
              height: boxHeight,
              top: (height / 2) + boxHeight,
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: width / 14),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: ((2 * width) / 3),
                        child: Center(
                          child: TextField(
                              style: TextStyle(fontSize: font_size),
                              // textAlign: TextAlign.center,
                              controller: eCtrl,
                              decoration: new InputDecoration.collapsed(
                                  hintText: "ENTER NAME"),
                              maxLines: 1,
                              onSubmitted: (String text) {}),
                        ),
                      ),
                      Container(
                        width: (width / 3) - (width / 14),
                        child: new FlatButton(
                          onPressed: () {
                            setState(() {
                              if (eCtrl.text != "") {
                                names.add(eCtrl.text);
                              }
                              eCtrl.clear();
                            });
                          },
                          child: new Icon(Icons.add_circle_outline,
                              size: width / 7),
                        ),
                      ),
                    ],
                    //),
                  ),
                ),
              ),
            ),
            // PLAY BOX
            Positioned(
              top: (height / 1.9) + 2 * boxHeight,
              width: width,
              height: boxHeight,
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0)),
                  color: Colors.orange,
                ),
                child: Center(
                  child: FlatButton(
                    color: Colors.orange,
                    textColor: Colors.black,
                    onPressed: () {
                      setState(() {
                        if (eCtrl.text != "") {
                          names.add(eCtrl.text);
                          count = count + 1;
                        }
                        eCtrl.clear();
                        navigateToSubPage(context);
                      });
                    },
                    child: const Text('PLAY', style: TextStyle(fontSize: 40)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: (height / sizeRatio) - (height / 10),
              child: Text(
                "BY NOCONTEXTSPORT",
                style: TextStyle(
                    fontSize: 20, color: Colors.white, fontFamily: "sd"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showName(String name) {
    double offset = name.length * 5.1;
    return new Container(
      decoration: new BoxDecoration(
          color: Colors.grey,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0),
            bottomLeft: const Radius.circular(40.0),
            bottomRight: const Radius.circular(40.0),
          )),
      padding: EdgeInsets.only(right: 10, left: 10),
      margin: const EdgeInsets.all(5),
      height: nameHeight,
      child: Text(
        name,
        style: TextStyle(fontSize: boxHeight / 2.5),
      ),
    );
  }

  Future navigateToSubPage(context) async {
    List<String> n2 = names;
    names = [];
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ModePage(names: n2)));
  }
}

class WarningPage extends StatefulWidget {
  @override
  _warningPageState createState() => _warningPageState();
}

class _warningPageState extends State<WarningPage> {
  double width;
  double fontSize;
  double height;
  double sizeRatio = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width * sizeRatio;
    height = MediaQuery.of(context).size.height * sizeRatio;
    fontSize = width / 8;
    return Scaffold(
        //  resizeToAvoidBottomInset: false,
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => navigateToMainPage(context),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(1)
                    ])),
                child:
                    new Stack(alignment: Alignment.center, children: <Widget>[
                  Positioned(
                    width: width,
                    // height: 100.0,
                    //  top: 150,
                    child: Container(
                      padding: EdgeInsets.all(0),
                      child: Center(
                        child: new Text(
                          "Your drinking is your own responsibility",
                          style: TextStyle(
                              color: Colors.white, fontSize: fontSize),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: height / 8,
                    child: Container(
                      //padding: EdgeInsets.all(50),
                      child: Center(
                        child: new Text(
                          "Tap To Agree",
                          style: TextStyle(
                              color: Colors.white, fontSize: width / 12),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ]))));
  }

  Future navigateToMainPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StartPage()));
  }
}
