import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                height: 60.0,
                width: 150.0,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.purpleAccent,
                  child: Text(
                    'PLAY',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                  shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: () {
                    navigateToSubPage(context);
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
