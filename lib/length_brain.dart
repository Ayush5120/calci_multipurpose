class LengthBrain {

  LengthBrain({this.topSelected, this.topVal, this.bottomSelected});

  final String topSelected;
  final String bottomSelected;
  final String topVal;



  // [0] = inch, [1] = cm, [2] = foot , [3] = yard

  List<double> forInch = [1.0 , 2.54, 0.0833, 0.0278];

  String getConversion()
  { if(topVal == '' || topVal == null)
  {
    return '            ';
  }
     if(topSelected == 'inch')
       {
         if(bottomSelected == 'cm')
           {
             return _getInchToCm();
           }
         else if(bottomSelected == 'foot')
         {
           return _getInchToFoot();
         }

         else if(bottomSelected == 'yard')
         {
           return _getInchToYard();
         }

         else
           return topVal;
       }


     else if(topSelected == 'cm')
     {
       if(bottomSelected == 'inch')
       {
         return _getCmToInch();
       }

       else if(bottomSelected == 'foot')
       {
         return _getCmToFoot();
       }

       else if(bottomSelected == 'yard')
       {
         return _getCmToYard();
       }

       else
         return topVal;
     }


     else if(topSelected == 'foot')
     {
       if(bottomSelected == 'inch')
       {
         return _getFootToInch();
       }

       else if(bottomSelected == 'cm')
       {
         return _getFootToCm();
       }

       else if(bottomSelected == 'yard')
       {
         return _getFootToYard();
       }

       else
         return topVal;
     }


     else if(topSelected == 'yard')
     {
       if(bottomSelected == 'inch')
       {
         return _getYardToInch();
       }

       else if(bottomSelected == 'cm')
       {
         return _getYardToCm();
       }

       else if(bottomSelected == 'foot')
       {
         return _getYardToFoot();
       }

       else
         return topVal;
     }


     else
       return "     ";

  }


  String _getInchToCm()
  {
    double dInch = double.parse(topVal);
    double result = dInch * 2.54;

    return result.toStringAsFixed(4);

  }

  String _getInchToFoot()
  {
    if(topVal == '' || topVal == null)
    {
      return '            ';
    }
    double dInch = double.parse(topVal);
    double result = dInch * 0.0833;

    return result.toStringAsFixed(4);

  }

  String _getInchToYard()
  {
    if(topVal == '' || topVal == null)
    {
      return '            ';
    }
    double dInch = double.parse(topVal);
    double result = dInch * 0.0278;

    return result.toStringAsFixed(4);

  }


  String _getCmToInch()
  {
    double dCm = double.parse(topVal);
    double result = dCm * 0.394 ;

    return result.toStringAsFixed(4);

  }

  String _getCmToFoot()
  {
    double dCm = double.parse(topVal);
    double result = dCm * 0.0328 ;

    return result.toStringAsFixed(4);

  }

  String _getCmToYard()
  {
    double dCm = double.parse(topVal);
    double result = dCm * 0.0109 ;

    return result.toStringAsFixed(4);

  }

  String _getFootToInch()
  {
    double dFoot = double.parse(topVal);
    double result = dFoot * 12 ;

    return result.toStringAsFixed(4);

  }

  String _getFootToCm()
  {
    double dFoot = double.parse(topVal);
    double result = dFoot * 30.48;

    return result.toStringAsFixed(4);

  }

  String _getFootToYard()
  {
    double dFoot = double.parse(topVal);
    double result = dFoot * 0.333 ;

    return result.toStringAsFixed(4);

  }


  String _getYardToInch()
  {
    double dYard = double.parse(topVal);
    double result = dYard * 36 ;

    return result.toStringAsFixed(4);

  }

  String _getYardToCm()
  {
    double dYard = double.parse(topVal);
    double result = dYard * 91.44 ;

    return result.toStringAsFixed(4);

  }

  String _getYardToFoot()
  {
    double dYard = double.parse(topVal);
    double result = dYard * 3 ;

    return result.toStringAsFixed(4);

  }


}   // Class ends