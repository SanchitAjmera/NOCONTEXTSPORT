import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';


class Questions {

  String name;

  List<Map<String, bool>> questions = [
    {
      'question1' : true,
      'answer1' : true,
      'answer2' : false,
      'answer3' : false,
    },
    {
      'question2' : true,
      'answer1' : true,
      'answer2' : true,
      'answer3' : false,
    },
    {
      'question3' : true,
      'answer1' : true,
      'answer2' : true,
      'answer3' : false,
    },
    {
      'question4' : true,
      'answer1' : true,
      'answer2' : true,
      'answer3' : false,
    },
    {
      'question5' : true,
      'answer1' : true,
      'answer2' : true,
      'answer3' : false,
    },
  ];

  Questions({Key key});

  Map<String, bool> getQuestion(){
    var _random = (Random().nextDouble() * questions.length).floor();
    return questions[_random];
  }

  List<int> getOrdering(){
    List<int> outcomes = [1,2,3];
    List<int> randInt = [];
    while(outcomes.length > 1){
      var _random = (Random().nextDouble() * 3).round() + 1;
      if (outcomes.contains(_random)){
        randInt.add(_random);
        outcomes.remove(_random);
      }
    }
    randInt.add(outcomes[0]);
    return randInt;
  }
}
