import 'package:flutter/material.dart';

class InterestCalculator extends StatefulWidget {
  @override
  _InterestCalculator createState() => _InterestCalculator();
}

class _InterestCalculator extends State<InterestCalculator> {
  var _formKey = GlobalKey<FormState>();
  var currencies = ['Rupees', 'Dollars', 'Euros', 'Others'];
  var selectedCurrency = '';

  var displayResult = '';

  final principalController = TextEditingController();
  final roiController = TextEditingController();
  final termsController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCurrency = currencies[0];
  }

  @override
  Widget build(BuildContext context) {
//    TextStyle textStyle = Theme.of(context).textTheme.body2;
//    TextStyle btnStyle = Theme.of(context).textTheme.button;

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Interest Calculator",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigoAccent,
          accentColor: Colors.indigoAccent),
      home: Scaffold(
        backgroundColor: Color(0xFF0A0E21),
//        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Interest Calculator'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  Center(child: getImage()),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      controller: principalController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter Principal Amount';
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Principal',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Enter Principal e.g 12000',
                          enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      controller: roiController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter Rate of Interest';
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: 'Rate of Interest',
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'In Percent',
                          enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              controller: termsController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Time';
                                }
                              },
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  labelText: 'Terms',
                                  labelStyle: TextStyle(color: Colors.white),
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Time in Years',
                                  enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),),
                            ),
                          ),
                          Container(width: 25),
                          Expanded(
                            child: DropdownButton<String>(
                              items: currencies.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  selectedCurrency = newValue;
                                });
                              },
                              value: selectedCurrency,
                            ),
                          )
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Colors.pink,
                            textColor: Colors.white,
                            child: Text(
                              'Calculate',
                              textScaleFactor: 1,
                            ),
                            onPressed: () {
                              debugPrint(displayResult);
                              setState(() {
                                if(_formKey.currentState.validate()) {
                                  displayResult = calculateTotalReturns();
                                }
                              });
                            },
                          ),
                        ),
                        Container(width: 25),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.pink,
                            textColor: Colors.white,
                            child: Text('Reset'),
                            onPressed: () {
                              setState(() {
                                resetValues();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      displayResult,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image img =
        Image(image: assetImage, width: 130, height: 140, fit: BoxFit.cover);
    return Container(
        child: img,
        margin: EdgeInsets.only(left: 0, top: 10.0, right: 0, bottom: 10));
  }

  String calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termsController.text);

    double totalAmntPayable = principal + (principal * roi * term) / 100;
    String result =
        'After $term years, your investment will be worth $totalAmntPayable $selectedCurrency';

    return result;
  }

  void resetValues() {
    principalController.text = '';
    roiController.text = '';
    termsController.text = '';
    displayResult = '';
    selectedCurrency = currencies[0];
  }
}
