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

class MainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<MainPage> {
  // collection of names inputed by player
  List<String> names = [];
  int _count = 0;
  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.pinkAccent[400].withOpacity(0.8), Colors.deepOrangeAccent[400].withOpacity(0.7)])),

        child: new Column(
          children: <Widget>[

            new Flexible(
              child: new ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Column(
                    children: <Widget>[
                      new Text(
                        names[index],
                        style: TextStyle(fontSize: 25),
                        textAlign: TextAlign.center)
                    ],
                  );
                }
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              child: Center(
                child: new AlertDialog(
                  contentPadding: EdgeInsets.only(
                    left: 40,
                    right: 20,
                  ),
                  //  title: new Text("Enter Name"),
                  content: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(0),
                        width: 130.0,
                        child: Center(
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                        //    textAlign: TextAlign.center,
                            controller: eCtrl,
                            decoration: new InputDecoration.collapsed( hintText: "ENTER NAME"),
                            maxLines: 1,
                            onSubmitted: (String text){}
                          ),
                        ),
                      ),
                      new Spacer(),
  //                    new Spacer(),
                      Container(
                        width: 40.0,
                        child: new FlatButton (
                          onPressed: () {
                            setState(() {
                              if (eCtrl.text != ""){
                                names.add(eCtrl.text);
                              }
                              eCtrl.clear();
                            });
                          },
                          child: new Icon(Icons.add_circle_outline),
                        ),
                      ),
                      Container(
                        width: 40.0,
                        child: new FlatButton (
                          onPressed: () {
                            setState(() {
                              if (eCtrl.text != ""){
                                names.add(eCtrl.text);
                              }
                              eCtrl.clear();
                              navigateToSubPage(context);
                            });
                          },
                          child: new Icon(Icons.arrow_forward),
                        ),
                      ),
                    ],
                  ),
                ),
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(names: n2)));
  }
}
