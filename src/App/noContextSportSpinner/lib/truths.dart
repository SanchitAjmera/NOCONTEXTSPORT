import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';


class Truths {

  String name;

  List<String> truths = [
    {
      'question1' : true,
      'answer1' : true,
      'answer2' : false,
      'answer3' : false,
    },
    {
      'question2' : true,
      'answer1' : true,
      'answer2' : false,
      'answer3' : false,
    },
    {
      'question3' : true,
      'answer1' : true,
      'answer2' : false,
      'answer3' : false,
    },
    {
      'question4' : true,
      'answer1' : true,
      'answer2' : false,
      'answer3' : false,
    },
    {
      'question5' : true,
      'answer1' : true,
      'answer2' : false,
      'answer3' : false,
    },
  ];

  Truths({Key key});

  Map<String, bool> getQuestion(){
    var _random = (Random().nextDouble() * truths.length).floor();
    return truths[_random];
  }
}
