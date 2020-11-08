import 'dart:math';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'main.dart';
import 'board_view.dart';
import 'model.dart';

class Questions {
  String name;

  List<List<Map<String, bool>>> questions = [
    [
      {
        'Which celebrity has Kim Kardashian said to have slept with in 2014':
            true,
        'Rafa Nadal': true,
        'Cristiano Ronaldo': false,
        'Sergio Ramos': false,
      },
      {
        'Which celebrity has Kim Kardashian said to have slept with in 2014':
            true,
        'Rafa Nadal': true,
        'Cristiano Ronaldo': false,
        'Sergio Ramos': false,
      },
    ],
    [
      {
        'Which celebrity has Kim Kardashian said to have slept with in 2014':
            true,
        'Rafa Nadal': true,
        'Cristiano Ronaldo': false,
        'Sergio Ramos': false,
      },
      {
        'Which celebrity has Kim Kardashian said to have slept with in 2014':
            true,
        'Rafa Nadal': true,
        'Cristiano Ronaldo': false,
        'Sergio Ramos': false,
      },
    ],
    [
      {
        'Which celebrity has Kim Kardashian said to have slept with in 2014':
            true,
        'Rafa Nadal': true,
        'Cristiano Ronaldo': false,
        'Sergio Ramos': false,
      },
      {
        'Which celebrity has Kim Kardashian said to have slept with in 2014':
            true,
        'Rafa Nadal': true,
        'Cristiano Ronaldo': false,
        'Sergio Ramos': false,
      },
    ]
  ];

  Questions({Key key});

  Map<String, bool> getQuestion(int option) {
    var _random = (Random().nextDouble() * questions[0].length).floor();
    return questions[option][_random];
  }

  List<int> getOrdering() {
    List<int> outcomes = [1, 2, 3];
    List<int> randInt = [];
    while (outcomes.length > 1) {
      var _random = (Random().nextDouble() * 3).round() + 1;
      if (outcomes.contains(_random)) {
        randInt.add(_random);
        outcomes.remove(_random);
      }
    }
    randInt.add(outcomes[0]);
    return randInt;
  }
}
