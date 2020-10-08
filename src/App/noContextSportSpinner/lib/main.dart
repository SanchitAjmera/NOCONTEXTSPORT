import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Schyler'),
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
  List<Widget> _listings = [];
  int count = 0;
  TextEditingController eCtrl = new TextEditingController();
  bool showDialog = false;


  @override
  Widget build(BuildContext context) {
    List<Widget> children = new List.generate(count, (int i) => new InputWidget(i));
    return Scaffold(
    //  resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.pinkAccent[400].withOpacity(0.8), Colors.deepOrangeAccent[400].withOpacity(0.7)])),

        child: new Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
              Column (
              // child: new ListView.builder(
              //   itemCount: names.length,
              //   itemBuilder: (BuildContext ctxt, int index) {
              //     return new Column(
              //       children: <Widget>[
              //         new Text(
              //           names[index],
              //           style: TextStyle(fontSize: 25),
              //           textAlign: TextAlign.center)
              //       ],
              //     );
              //   }
              // ),
                children: children,
              ),
            Positioned(
              width: 300.0,
              height: 100.0,
              top: 100,
              child : Container(
                child: Center(
                  child: new Image.asset('asset/image/sportify.png'),
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
                    //  title: new Text("Enter Name"),
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
                              decoration: new InputDecoration.collapsed( hintText: "Enter Name"),
                              maxLines: 1,
                              onSubmitted: (String text){}
                            ),
                          ),
                        ),
                        new Spacer(),
    //                    new Spacer(),
                        Container(
                          width: 80.0,
                          child: new FlatButton (
                            onPressed: () {
                              setState(() {
                                if (eCtrl.text != ""){
                                  names.add(eCtrl.text);
                                //  _listings.add(Text("hello"));
                                }
                                eCtrl.clear();
                              });
                            },
                            child: new Icon(Icons.add_circle_outline, size: 40.0),
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
                  color: Colors.grey[900],
                  textColor: Colors. white,
                  onPressed: () {
                    setState(() {
                      if (eCtrl.text != ""){
                        names.add(eCtrl.text);
                        count = count +1;
                      }
                      eCtrl.clear();
                      navigateToSubPage(context);
                    });
                  },
                  child: const Text('Play', style: TextStyle(fontSize: 40)),
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

class InputWidget extends StatelessWidget {

  final int index;

  InputWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return new Text("InputWidget: " + index.toString());
  }
}
