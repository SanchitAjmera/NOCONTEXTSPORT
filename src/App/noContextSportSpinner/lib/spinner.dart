import 'package:flutter/material.dart';
import 'dart:math';

class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  final double initialRadius = 30.0;

  double radius = 0.0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));

    animation_radius_out = Tween<double>(
      begin: 0.0,
      end: 1.0
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener((){

      setState(() {
        if(controller.value>= 0.75 && controller.value <= 1.0){
          radius = animation_radius_in.value * initialRadius;
        } else if(controller.value >= 0.0 && controller.value <= 0.25){
          radius = animation_radius_out.value * initialRadius;
        }
      });

    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: Stack(
          children: <Widget>[
            Dot(
              radius: 30.0,
              color: Colors.black12,
            ),

            Transform.translate(
              offset: Offset(radius * cos(pi), radius * sin(pi)),
              child : Dot(
                radius: 5.0,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {

  final double radius;
  final Color color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}
