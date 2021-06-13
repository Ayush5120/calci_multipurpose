import 'package:flutter/material.dart';

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCity();
  }
}

class _FavoriteCity extends State<FavoriteCity> {
  String cityName = "";
  var currencies = ['Rupees', 'Dollars', 'Euros', 'Others'];
  var selectedCurrency = "Rupees";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //debugPrint("Favourite City widget cretaed!");

    return MaterialApp(
      title: 'Stateful App Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful App Example'),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(fontSize: 20),
                onChanged: (String userCity) {
                  setState(() {
                    debugPrint("favorite city state update se phle $cityName");
                    cityName = userCity;
                  });
                },
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Your city is $cityName",
                    style: TextStyle(fontSize: 20),
                  )),
              DropdownButton<String>(
                items: currencies.map((String dropDownItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownItem,
                    child: Text(dropDownItem),
                  );
                }).toList(),

                onChanged: (String newSelectedValue) {
                  setState(() {
                    selectedCurrency = newSelectedValue;
                  });
                },

                value: selectedCurrency,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
