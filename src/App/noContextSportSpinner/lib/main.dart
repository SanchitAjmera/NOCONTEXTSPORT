import 'package:flutter/material.dart';
import 'dart:math';

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
/*
class SubPage extends StatelessWidget with TickerProviderStateMixin{
   Animation _animation;
   AnimationController _animationController;
   var rng = new Random();
   Tween _tween;

   double randomNumber() {
     return rng.nextDouble();
   }

   @override
   SubPage() {
     // TODO: implement initState
     super.initState();
     _animationController =
         AnimationController(vsync: this, duration: Duration(seconds: 3));
     _tween = new Tween<double>(
         begin: rng.nextInt(3).toDouble(), end: rng.nextInt(3).toDouble());

     _animationController.forward();
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         body: Stack(
       children: <Widget>[
         Container(
           height: MediaQuery.of(context).size.height,
           child: Image.asset(
             "assets/floor.jpg",
             fit: BoxFit.fill,
           ),
         ),
         Center(
           child: Container(
             child: RotationTransition(
                 turns: Tween(begin: 0.0, end: randomNumber()).animate(
                     new CurvedAnimation(
                         parent: _animationController, curve: Curves.linear)),
                 child: GestureDetector(
                     onTap: () {
                       setState(() {
                         _animationController = AnimationController(
                             vsync: this, duration: Duration(seconds: 3));
                         _tween = new Tween<double>(
                             begin: rng.nextInt(3).toDouble(),
                             end: rng.nextInt(3).toDouble());

                         _animationController.forward();
                       });
                     },
                     child: Image.asset(
                       "assets/bottle.png",
                       height: 250,
                       width: 250,
                     ))),
           ),
         ),
       ],
     )
   );
  }
}
*/
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;
  var lastPosition = 0.0;
  var rng = new Random();
  Tween _tween;

  double randomNumber() {
    lastPosition =  rng.nextDouble();
    return lastPosition;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _tween = new Tween<double>(
        begin: rng.nextInt(3).toDouble(), end: rng.nextInt(3).toDouble());

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/floor.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Container(
            child: RotationTransition(
                turns: Tween(begin: lastPosition, end: randomNumber()).animate(
                    new CurvedAnimation(
                        parent: _animationController, curve: Curves.linear)),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _animationController = AnimationController(
                            vsync: this, duration: Duration(seconds: 3));
                        _tween = new Tween<double>(
                            begin: rng.nextInt(3).toDouble(),
                            end: rng.nextInt(3).toDouble());

                        _animationController.forward();
                      });
                    },
                    child: Image.asset(
                      "assets/bottle.jpg",
                      height: 250,
                      width: 250,
                    ))),
          ),
        ),
      ],
    ));
  }
}

Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) =>
  HomePage()));
}
