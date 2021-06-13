import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Interest Calculator App',
    home: SIForm(),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ['Choose Currency', 'Rupees', 'Dollars', 'Pounds'];
  final double _minimumPadding = 5.0;
  var _currentItemSelected = 'Choose Currency';
  var displayResult = '';
  var _choice = 'Simple Interest';
  var _altChoice = 'Compound Interest';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            if (_choice == 'Simple Interest') {
              _altChoice = _choice;
              _choice = 'Compound Interest';
            } else {
              _altChoice = _choice;
              _choice = 'Simple Interest';
            }
            _reset();
          });
        },
        label: Text(_altChoice),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 15.0),
                  child: Text(
                    _choice,
                    textScaleFactor: 2.5,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Calculator",
                    textScaleFactor: 2.0,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                getImageAsset(),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                       style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      controller: principalController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter Principal Amount';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Principal',
                          hintText: 'Enter Principal',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      controller: roiController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter rate of interest';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Rate of Interest',
                          hintText: 'In percent',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                                style: TextStyle(
                        color: Colors.white,
                      ),
                          keyboardType: TextInputType.number,
                          controller: termController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter time';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in years',
                            labelStyle: TextStyle(color: Colors.white),
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.pinkAccent),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.pinkAccent),
                            ),
                          ),
                        )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.pink),
                              ),
                            );
                          }).toList(),
                          value: _currentItemSelected,
                          onChanged: (String newValueSelected) {
                            _onDropDownItemSelected(newValueSelected);
                          },
                        ))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: _minimumPadding, top: _minimumPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Colors.pink,
                            textColor: Colors.white,
                            colorBrightness: Brightness.dark,
                            child: Text(
                              'Calculate',
                              textScaleFactor: 1.2,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(16.0),
                                side: BorderSide(color: Colors.pink)),
                            onPressed: () {
                              if (_formKey.currentState.validate())
                                setState(() {
                                  if (_formKey.currentState.validate()) {
                                    this.displayResult =
                                        _calculateTotalReturns();
                                  }
                                });
                            },
                          ),
                        ),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                          child: RaisedButton(
                            colorBrightness: Brightness.dark,
                            child: Text(
                              'Reset',
                              textScaleFactor: 1.2,
                            ),
                            color: Colors.pink,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(16.0),
                                side: BorderSide(color: Colors.pink)),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            },
                          ),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minimumPadding * 2),
                  child: Text(this.displayResult),
                )
              ],
            )),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/logo.jpeg');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    if (_choice == 'Simple Interest') {
      if (_currentItemSelected != _currencies[0]) {
        double totalAmountPayable = principal + (principal * roi * term) / 100;
        totalAmountPayable = num.parse(totalAmountPayable.toStringAsFixed(2));
        String result =
            'Your investment will be worth $totalAmountPayable $_currentItemSelected';
        return result;
      } else {
        String result = 'Choose Currency and try again';
        return result;
      }
    } else {
      if (_currentItemSelected != _currencies[0]) {
        double totalAmountPayable =
            principal * (math.pow((1 + roi / 100), term));
        totalAmountPayable = num.parse(totalAmountPayable.toStringAsFixed(2));
        String result =
            'Your investment will be worth $totalAmountPayable $_currentItemSelected';
        return result;
      } else {
        String result = 'Choose Currency and try again';
        return result;
      }
    }
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _currencies[0];
  }
}
