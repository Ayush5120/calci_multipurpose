import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:scientific_calculator/Area.dart';



import 'package:scientific_calculator/currency_converter.dart';

import 'package:scientific_calculator/temperature_converter.dart';
import 'package:scientific_calculator/weight_converter.dart';
import 'category_box.dart';
import 'length_converter.dart';
import 'Loan.dart';
class LandingScreen extends StatelessWidget {
  const LandingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xFF0A0E21),
            body: SafeArea(
              child: Container( 
                
                child: Column(
                  children: <Widget>[
                     Row(children: <Widget>[
                    CategoryBox(
                      pic: MaterialCommunityIcons.ruler,
                      text: 'Length',
                      rang: Colors.red,
                      action: () {
                        Future.delayed(const Duration(milliseconds: 155), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LengthConverter()),
                          );
                        });
                      },
                    ), // Length Box
                    CategoryBox(
                      pic: MaterialCommunityIcons.weight,
                      text: 'Weight',
                      rang: Colors.orangeAccent,
                      action: () {
                        Future.delayed(const Duration(milliseconds: 155), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeightConverter()),
                          );
                        });
                      },
                    ), // Weight Box

                    
                  ]),
                   Row(children: <Widget>[
                    CategoryBox(
                      pic: MaterialCommunityIcons.thermometer,
                      text: 'Temp',
                      rang: Colors.red,
                      action: () {
                        Future.delayed(const Duration(milliseconds: 155), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TemperatureConverter()),
                          );
                        });
                      },
                    ), // Length Box
                    CategoryBox(
                      pic: MaterialCommunityIcons.currency_inr,
                      text: 'Exc',
                      rang: Colors.orangeAccent,
                      action: () {
                        Future.delayed(const Duration(milliseconds: 155), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CurrencyConverter()),
                          );
                        });
                      },
                    ), // Weight Box

                    
                  ]),
                   Row(children: <Widget>[
                    CategoryBox(
                      pic: MaterialCommunityIcons.home,
                      text: 'Area',
                      rang: Colors.red,
                      action: () {
                        Future.delayed(const Duration(milliseconds: 155), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>App()),
                          );
                        });
                      },
                    ), // Length Box
                    CategoryBox(
                      pic: MaterialCommunityIcons.cash_refund,
                      text: 'Loan',
                      rang: Colors.orangeAccent,
                      action: () {
                        Future.delayed(const Duration(milliseconds: 155), () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loan()),
                          );
                        });
                      },
                    ), // Weight Box

                    
                  ]),
                  ]
                ),
              ),
            )),
      ),
    );
  }
}
