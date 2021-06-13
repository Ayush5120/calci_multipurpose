import 'package:flutter/material.dart';
import 'package:scientific_calculator/views/dashboard/home_page.dart';
import 'package:scientific_calculator/views/splash/splash_screen.dart';

void main() {
  runApp(Loan());
}

class Loan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xFF0A0E21),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    _init();
  }

  _init() async {
    await Future.delayed(new Duration(seconds: 2));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
