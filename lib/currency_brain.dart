import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class CurrencyBrain {

  CurrencyBrain({this.topSelected, this.topVal, this.bottomSelected});

  final String topSelected;
  final String bottomSelected;
  final String topVal;






  Future <String> getConversion() async
  { 

  if(topVal == null || topVal.isEmpty || topVal ==''|| 
  bottomSelected == null || bottomSelected.isEmpty || bottomSelected ==''||
  topSelected == null || topSelected.isEmpty || topSelected =='')
  {
    return topVal;
  }
  else
   return getData(double.parse(topVal) , topSelected, bottomSelected);

  }

 

}

Future<String> getData(double nVal, String fVal, String sVal) async {
    var response = await http.get(
        Uri.encodeFull(
            "http://data.fixer.io/api/latest?access_key=16cb441d35842dae8244a3c0e6f5b9e8"),
        headers: {"Accept": "application/json"});

    Map<String, dynamic> data = json.decode(response.body);
    
    String fGot = data['rates'][fVal].toString();
    String sGot = data['rates'][sVal].toString();

    double res = nVal * ( double.parse(sGot) / double.parse(fGot));
  
  return res.toStringAsFixed(3);
  }


//http://data.fixer.io/api/latest?access_key=16cb441d35842dae8244a3c0e6f5b9e8