import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:scientific_calculator/Age.dart';
import 'package:scientific_calculator/BTD.dart';
import 'package:scientific_calculator/GSTForm.dart';
import 'package:scientific_calculator/Intrest.dart';
import 'package:scientific_calculator/bmicalculator.dart';
import 'package:scientific_calculator/compound.dart';
import 'package:scientific_calculator/dimple.dart';
import 'package:scientific_calculator/screens/HOmePage.dart';

import 'category_box.dart';

class thirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF0A0E21),
          body: SafeArea(
            child: Container(
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  CategoryBox(
                    pic: MaterialCommunityIcons.bank_plus,
                    text: 'GST',
                    rang: Colors.white,
                    action: () {
                      Future.delayed(const Duration(milliseconds: 155), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GSTForm()),
                        );
                      });
                    },
                  ), // Length Box
                  CategoryBox(
                    pic: MaterialCommunityIcons.human_male_female,
                    text: 'BMI',
                    rang: Colors.orangeAccent,
                    action: () {
                      Future.delayed(const Duration(milliseconds: 155), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMICalculator()),
                        );
                      });
                    },
                  ), // Weight Box
                ]),
                
                Row(children: <Widget>[
                  CategoryBox(
                    pic: MaterialCommunityIcons.percent,
                    text: 'Discount',
                    rang: Colors.white,
                    action: () {
                      Future.delayed(const Duration(milliseconds: 155), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Discount()),
                        );
                      });
                    },
                  ), // Length Box
                  CategoryBox(
                    pic: MaterialCommunityIcons.decimal_increase,
                    text: 'BTD',
                    rang: Colors.orangeAccent,
                    action: () {
                      Future.delayed(const Duration(milliseconds: 155), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BTD()),
                        );
                      });
                    },
                  ), // Weight Box
                ]),
                
                Row(children: <Widget>[
                  CategoryBox(
                    pic: MaterialCommunityIcons.timelapse,
                    text: 'Age',
                    rang: Colors.white,
                    action: () {
                      Future.delayed(const Duration(milliseconds: 155), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HOmePage()),
                        );
                      });
                    },
                  ), // Length Box
                  CategoryBox(
                    pic: MaterialCommunityIcons.piggy_bank,
                    text: 'Intrest',
                    rang: Colors.orangeAccent,
                    action: () {
                      Future.delayed(const Duration(milliseconds: 155), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>SIForm()),
                        );
                      });
                    },
                  ), // Weight Box

                  
                ]),
              ]),
            ),
          )),
    );
  }
}
