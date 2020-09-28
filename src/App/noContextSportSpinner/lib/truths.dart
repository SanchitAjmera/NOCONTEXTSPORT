import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';


class Truths {

  String name;

  List<String> truths = [
    "truth_1",
    "truth_2",
    "truth_3",
    "truth_4",
    "truth_5",
    "truth_6",
    "truth_7",
    "truth_8"
  ];

  Truths({Key key});

String getTruth(){
    var _random = (Random().nextDouble() * truths.length).floor();
    return truths[_random];
  }
}
