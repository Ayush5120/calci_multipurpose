import 'package:flutter/material.dart';

// ignore: camel_case_types
class GSTForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GSTForm();
  }
}

class _GSTForm extends State<GSTForm> {
  var rates = [5, 12, 18];
  var gstRate = 18;
  double includingRate = 0;
  double gstAmount = 0;
  double excludingRate = 0;

  @override
  void initState() {
    super.initState();
    gstRate = rates[2];
  }

  TextEditingController includingGSTController = new TextEditingController();
  TextEditingController excludingGSTController = new TextEditingController();
  TextEditingController gstController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
 
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        body: Container(
       
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              getGSTIcon(),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Select GST Rate',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      width: 10.0,
                    ),
                    Expanded(
                      child: DropdownButton<int>(
                        items: rates.map((rate) {
                          return DropdownMenuItem<int>(
                            value: rate,
                            child: Text(
                              '$rate %',
                              style: TextStyle(color: Colors.pink),
                            ),
                          );
                        }).toList(),
                        onChanged: (rate) {
                          if (rate != gstRate)
                            setState(() {
                              gstRate = rate;
                              includingGSTController.clear();
                              gstController.clear();
                              excludingGSTController.clear();
                            });
                        },
                        value: gstRate,
                      ),
                    )
                  ],
                ),
              ),
               SizedBox(
               height: 20,
              ),
              //Widget getGSTRateDropDown(),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextField(
                    
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      setState(() {
                        includingRate =
                            value.length > 0 ? double.parse(value) : 0;
                       // double gst = (includingRate * gstRate / 100);
                        double excluding = includingRate*100/(100+gstRate);
                        double gst = (excluding* gstRate / 100);
                        gstController.text = gst.toStringAsFixed(2);
                        
                        excludingGSTController.text =
                            excluding.toStringAsFixed(2);
                      });
                    },
                    controller: includingGSTController,
                    decoration: InputDecoration(
                        hintText: 'including GST',
                        hintStyle: TextStyle(color: Colors.white24),
                        labelText: 'Price including GST',
                        labelStyle: TextStyle(color: Colors.white),
                       
                       enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),),
                  )),
                   SizedBox(
               height: 20,
              ),
              Padding(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    double excluding;
                    double including;
                    setState(() {
                      if (gstRate != 0) {
                        gstAmount = value.length > 0 ? double.parse(value) : 0;
                        excluding = (100 / gstRate) * gstAmount;
                        including = excluding + gstAmount;
                      } else {
                        gstAmount = 0;
                        excluding = (100 / 1) * gstAmount; 
                        including = excluding + gstAmount;
                      }

                      includingGSTController.text =
                          including.toStringAsFixed(2);
                      excludingGSTController.text =
                          excluding.toStringAsFixed(2);
                    });
                  },
                  controller: gstController,
                  decoration: InputDecoration(
                      hintText: 'GST',
                      hintStyle: TextStyle(color: Colors.white24),
                      labelText: 'GST ($gstRate%)',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),),
                ),
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
               SizedBox(
               height: 20,
              ),
              Padding(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      excludingRate =
                          value.length > 0 ? double.parse(value) : 0;
                      double gst = (gstRate * excludingRate) / 100;
                      double including = excludingRate + gst;

                      gstController.text = gst.toStringAsFixed(2);
                      includingGSTController.text =
                          including.toStringAsFixed(2);
                    });
                  },
                  controller: excludingGSTController,
                  decoration: InputDecoration(
                      labelText: 'Price excluding GST',
                      hintText: 'excluding GST',
                      hintStyle: TextStyle(color: Colors.white24),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),
      focusedBorder: new OutlineInputBorder(
        borderRadius: new BorderRadius.circular(25.0),
        borderSide:  BorderSide(color: Colors.pinkAccent ),

      ),),
                ),
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              ),
              SizedBox(
               height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: RaisedButton(
                  color: Colors.pink,
                  padding: EdgeInsets.only(
                      top: 15.0, bottom: 15.0, left: 100.0, right: 100.0),
                  child: Text(
                    'Clear',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    includingGSTController.clear();
                    excludingGSTController.clear();
                    gstController.clear();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getGSTIcon() {
    AssetImage assetImage = AssetImage('images/icon.png');
    Image image = Image(image: assetImage, height: 150.0, width: 300.0);
    return Container(
      child: image,
      alignment: Alignment(0.0, 0.0),
      margin: EdgeInsets.all(25.0),
    );
  }

//  Widget getGSTRateDropDown() {
//    DropdownButton<String>(
//
//    )
//  }
}
