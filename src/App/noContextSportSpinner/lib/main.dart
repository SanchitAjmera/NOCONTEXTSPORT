import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    //  home: MyHomePage(title: 'NOCONTEXTAPP-spinner '),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('NOCONTEXTSPORT'),
      ),

      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click button to start game'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child:Text('Start'),
              onPressed: () {
                navigateToSubPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class SubPage extends StatelessWidget with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/floor.jpg",
            fit: BoxFit.fill,),
          ),
          Center(
            child: Container(
              child: RotationTransition(
                turns: Tween(
                  
                ),
                child: Image.asset("assets/bottle.jpg"),
                width: 250, height: 250,),
              ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
      ),
    );
  }
}


Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
  SubPage()));
}
