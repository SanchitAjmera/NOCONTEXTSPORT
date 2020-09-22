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
      home: MainPage(),//MultiForm(),
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
      appBar: new AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add_comment),
            onPressed: () {
              setState(() {
                showDialog = true;
              });
            }
          )
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Text("Hello world"),
          showDialog ?
            new AlertDialog(
              title: new Text("Enter Name"),
              content: new TextField(
                controller: eCtrl,
                decoration: new InputDecoration.collapsed(hintText: "ADD NAME"),
                maxLines: 1,
                onSubmitted: (String text){

                }
              ),
              actions: <Widget>[
                new FlatButton (
                  onPressed: () {
                    setState(() {
                      showDialog = false;
                      names.add(eCtrl.text);
                      eCtrl.clear();
                    });
                  },
                  child: new Text("OK"),
                )
              ],
            ) : new Text(""),

            new Flexible(
              child: new ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Column(
                    children: <Widget>[

                      new Text(names[index])
                    ],
                  );
                }
              )
            )
          ],
        )
      );
  }


  Future navigateToSubPage(context) async {
    List<String> n2 = names;
    names = [];
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(names: n2)));
  }
}
