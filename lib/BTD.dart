import 'package:flutter/material.dart';
import 'calc.dart';

class BTD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calc(),
      theme: ThemeData(
        backgroundColor: Color(0xFF0A0E21),
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
