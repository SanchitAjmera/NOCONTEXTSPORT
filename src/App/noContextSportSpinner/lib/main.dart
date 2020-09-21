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
  // collection of names inputed by player
  List<String> names = new List();
  List<Widget> _children = [];
  List<TextEditingController> controllers = [];  //the controllers list
  int _count = 0;

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
                    var _formKey = GlobalKey<FormState>();

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                right: -40.0,
                                top: -40.0,
                                child: InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(0),
                                  children: <Widget>[
                                    Center(
                                      child: Card(
                                        // changed gap between first and second borders
                                        elevation: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(0.0),
                                          child: Column(
                                            children: <Widget>[
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              TextField(
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.person),
                                                  labelText: "Enter Name",
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              Material(
                                                borderRadius: BorderRadius.circular(30.0),
                                                //elevation: 5.0,
                                                child: MaterialButton(
                                                  onPressed: () => {},
                                                  minWidth: 150.0,
                                                  height: 50.0,
                                                  color: Color(0xFF179CDF),
                                                  child: Text(
                                                    "LOGIN",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                                // child: Column(
                                //   mainAxisSize: MainAxisSize.min,
                                //   children: <Widget>[
                                //     Padding(
                                //       padding: EdgeInsets.all(5.0),
                                //       child: TextFormField(
                                //         decoration: InputDecoration(
                                //           labelText: 'Name',
                                //         ),
                                //         onSaved: (input) => names.add(input),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.all(5.0),
                                //       child: TextFormField(
                                //         decoration: InputDecoration(
                                //           labelText: 'Name',
                                //         ),
                                //         onSaved: (input) => names.add(input),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.all(5.0),
                                //       child: TextFormField(
                                //         decoration: InputDecoration(
                                //           labelText: 'Name',
                                //         ),
                                //         onSaved: (input) => names.add(input),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.all(5.0),
                                //       child: TextFormField(
                                //         decoration: InputDecoration(
                                //           labelText: 'Name',
                                //         ),
                                //         onSaved: (input) => names.add(input),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.all(5.0),
                                //       child: TextFormField(
                                //         decoration: InputDecoration(
                                //           labelText: 'Name',
                                //         ),
                                //         onSaved: (input) => names.add(input),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: EdgeInsets.all(5.0),
                                //       child: TextFormField(
                                //         decoration: InputDecoration(
                                //           labelText: 'Name',
                                //         ),
                                //         onSaved: (input) => names.add(input),
                                //       ),
                                //     ),
                                //     Padding(
                                //       padding: const EdgeInsets.all(5.0),
                                //       child: RaisedButton(
                                //         child: Text("Done"),
                                //         onPressed: () {
                                //           if (_formKey.currentState.validate()) {
                                //             _formKey.currentState.save();
                                //             navigateToSubPage(context);
                                //         //    getNames();
                                //           }
                                //         },
                                //       ),
                                //     )
                                //   ],
                                // ),
                              // ),
                            ],
                          ),
                        );
                      }
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  void _add() {

    TextEditingController controller = TextEditingController();
    controllers.add(controller);      //adding the current controller to the list

    for(int i = 0; i < controllers.length; i++){
      print(controllers[i].text);     //printing the values to show that it's working
    }

    _children = List.from(_children)
      ..add(TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: "This is TextField $_count"),
      ));
  }

  Future navigateToSubPage(context) async {
    print(names);
    List<String> n2 = names;
    names = [];
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(names: n2)));
  }
}
