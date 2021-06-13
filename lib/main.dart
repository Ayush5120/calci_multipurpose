import 'package:flutter/material.dart';
import 'package:scientific_calculator/landing_screen.dart';
import 'package:scientific_calculator/third.dart';
import 'scientificCalculator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Color(0xFF0A0E21),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60), // here the desired height
            child: AppBar(
              backgroundColor: Color(0xFF0A0E21),
              bottom: new TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                tabs: <Widget>[
                  new Tab(
                    icon: Icon(MdiIcons.calculatorVariant),
                  ),
                  new Tab(icon: Icon(MdiIcons.hammerScrewdriver)),
                  new Tab(icon: Icon(MdiIcons.mathCompass))
                ],
              ),
            ),
          ),
          body: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              new ScientificCalculator(),
              new thirdPage(),
              new LandingScreen(),
            ],
          )),
          
    );
  }
}
