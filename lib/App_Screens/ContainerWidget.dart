import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    // TODO: implement build
    return Center(
        child: Container(
      alignment: Alignment.center,
//    width: 200.0,
//    height: 100.0,d
      margin: EdgeInsets.all(20.0),
      color: Colors.deepOrangeAccent,
      child: Text(
        wordPair.asPascalCase,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontSize: 25.0,
            fontFamily: 'Ruge Boogie',
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic),
      ),
    ));
  }
}
