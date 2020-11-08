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
      title: 'Flutter Demo',
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () => navigateToWarningPage(context));
  }

  Future navigateToWarningPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WarningPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  resizeToAvoidBottomInset: false,
        body: GestureDetector(
      behavior: HitTestBehavior.opaque,
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
            width: 350.0,
            height: 100.0,
            //  top: 150,
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
}

class _mainPageState extends State<StartPage> {
  // collection of names inputed by player
  List<String> names = [];
  List<Widget> _listings = [];
  int count = 0;
  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration.zero, () => drinkingAgreement(context));
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
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
              width: 300.0,
              height: 100.0,
              top: 150,
              child: Container(
                child: Center(
                  child:
                      Container(), //new Image.asset('asset/image/sportify.png'),
                ),
              ),
            ),
            Positioned(
              width: 400.0,
              height: 120.0,
              top: 300,
              child: Container(
                child: Center(
                  child: new AlertDialog(
                    contentPadding: EdgeInsets.only(
                      left: 40,
                      right: 0,
                    ),
                    //  title: new Text("ENTER NAME"),
                    content: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(0),
                          width: 180.0,
                          child: Center(
                            child: TextField(
                                style: TextStyle(fontSize: 30),
                                //    textAlign: TextAlign.center,
                                controller: eCtrl,
                                decoration: new InputDecoration.collapsed(
                                    hintText: "ENTER NAME"),
                                maxLines: 1,
                                onSubmitted: (String text) {}),
                          ),
                        ),
                        new Spacer(),
                        //                    new Spacer(),
                        Container(
                          width: 80.0,
                          child: new FlatButton(
                            onPressed: () {
                              setState(() {
                                if (eCtrl.text != "") {
                                  names.add(eCtrl.text);
                                  //  _listings.add(Text("hello"));
                                }
                                eCtrl.clear();
                              });
                            },
                            child:
                                new Icon(Icons.add_circle_outline, size: 40.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 410,
              width: 300.0,
              height: 70.0,
              child: Container(
                child: FlatButton(
                  color: Colors.orange[600],
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
            Positioned(
              bottom: 10,
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    // width: 350.0,
                    // height: 100.0,
                    //  top: 150,
                    child: Container(
                      padding: EdgeInsets.all(60),
                      child: Center(
                        child: new Text(
                          "Your drinking is your own responsibility",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // width: 350.0,
                    // height: 100.0,
                    bottom: 50,
                    child: Container(
                      padding: EdgeInsets.all(50),
                      child: Center(
                        child: new Text(
                          "Tap To Agree",
                          style: TextStyle(color: Colors.white, fontSize: 30),
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
