import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';



class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child:  Center(
          child: Text(
            generateLuckyNumber(),
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 30.0),
          )
      ),
    );
  }
}
String generateLuckyNumber() {
  final wordPair = WordPair.random();
  var random = Random();
  var luckNo = random.nextInt(100);
  return "${wordPair.asPascalCase} ${luckNo}";
}