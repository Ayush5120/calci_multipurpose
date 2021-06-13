import 'package:flutter/material.dart';
import 'length_brain.dart';

class LengthConverter extends StatefulWidget {
  @override
  _LengthConverterState createState() => _LengthConverterState();
}

class _LengthConverterState extends State<LengthConverter> {
  String topText = '';
  String bottomText = '                     ';
  String topSelected;
  String bottomSelected;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xFF283637),
        textTheme: TextTheme(
            // We can't change text colors directly, we need to use text theme.
            // ignore: deprecated_member_use
            body1: TextStyle(color: Colors.white)),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          title: Text('Length Converter'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30.0, top: 20.0),
                      child: DropdownButton<String>(
                        hint: Text('Select Units',
                            style: TextStyle(color: Colors.blueAccent)),
                        value: topSelected,
                        style: TextStyle(color: Colors.red, fontSize: 35.0),
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.black,
                        items: [
                          DropdownMenuItem(
                            value: "inch",
                            child: Text(
                              'inch',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "cm",
                            child: Text(
                              'cm',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "foot",
                            child: Text(
                              'foot',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "yard",
                            child: Text(
                              'yard',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            topSelected = value;
                            LengthBrain ab = LengthBrain(
                                topVal: topText,
                                topSelected: topSelected,
                                bottomSelected: bottomSelected);
                            bottomText = ab.getConversion();
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 35.0),
                      child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            //hintText: inchHint,
                            //hintStyle: TextStyle(fontWeight: FontWeight.w600, color:  Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            topText = text;
                            LengthBrain ab = LengthBrain(
                                topVal: topText,
                                topSelected: topSelected,
                                bottomSelected: bottomSelected);
                            setState(() {
                              bottomText = ab.getConversion();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Transform.rotate(
                angle: 1.571,
                child: Container(
                  child: Center(
                    child: Icon(Icons.compare_arrows,
                        size: 80.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(50.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 30.0, top: 20.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 115.0),
                        child: DropdownButton<String>(
                          hint: Text('Select Units',
                              style: TextStyle(color: Colors.red)),
                          value: bottomSelected,
                          style: TextStyle(color: Colors.red, fontSize: 35.0),
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black,
                          items: [
                            DropdownMenuItem(
                              value: "inch",
                              child: Text(
                                'inch',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "cm",
                              child: Text(
                                'cm',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "foot",
                              child: Text(
                                'foot',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "yard",
                              child: Text(
                                'yard',
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          ],
                          onChanged: (value) {
                            setState(() {
                              bottomSelected = value;
                              LengthBrain ab = LengthBrain(
                                  topVal: topText,
                                  topSelected: topSelected,
                                  bottomSelected: bottomSelected);
                              bottomText = ab.getConversion();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 35.0),
                      child: Container(
                        color: Colors.pink,
                        child: Text(
                          bottomText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TextField(
//keyboardType: TextInputType.number,
//onSubmitted: (text){
//inpText = text;
//
//print(inpText);
//
//}
//
//),
