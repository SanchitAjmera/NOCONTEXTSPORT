import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';


class TD {

  String name;

  List<String> truths = [
    "Who around the table do you think has slept with the most people?",
    "Who around the table do you think has slept with the most people?",
    "Who around the table do you think has slept with the most people?",
    "Who around the table do you think has slept with the most people?",
    "Who around the table do you think has slept with the most people?",
    "Who around the table do you think has slept with the most people?",
    "Who around the table do you think has slept with the most people?",
  ];

  List<String> dares = [
    "Neck the remainder of your drink!",
    "Neck the remainder of your drink!",
    "Neck the remainder of your drink!",
    "Neck the remainder of your drink!",
    "Neck the remainder of your drink!",
    "Neck the remainder of your drink!",
    "Neck the remainder of your drink!",

  ];

  TD({Key key});

  String getTruth(){
    var _random = (Random().nextDouble() * truths.length).floor();
    return truths[_random];
  }

  String getDare(){
    var _random = (Random().nextDouble() * truths.length).floor();
    return dares[_random];
  }
}
