class WeightBrain {

  WeightBrain({this.topSelected, this.topVal, this.bottomSelected});

  final String topSelected;
  final String bottomSelected;
  final String topVal;






  String getConversion()
  { if(topVal == '' || topVal == null)
  {
    return '            ';
  }
  if(topSelected == 'gram')
  {
    if(bottomSelected == 'kilogram')
    {
      return _getGramToKiloGram();
    }
    else if(bottomSelected == 'pound')
    {
      return _getGramToPound();
    }


    else
      return topVal;
  }


  else if(topSelected == 'kilogram')
  {
    if(bottomSelected == 'gram')
    {
      return _getKilogramToGram();
    }

    else if(bottomSelected == 'pound')
    {
      return _getKilogramToPound();
    }

    else
      return topVal;
  }


  else if(topSelected == 'pound')
  {
    if(bottomSelected == 'gram')
    {
      return _getPoundToGram() ;
    }

    else if(bottomSelected == 'kilogram')
    {
      return _getPoundToKilogram();
    }

    else
      return topVal;
  }

  else
    return "     ";

  }


  String _getGramToKiloGram()
  {
    double dGram = double.parse(topVal);
    double result = dGram * 0.001;

    return result.toStringAsFixed(4);

  }

  String _getGramToPound()
  {
    double dGram = double.parse(topVal);
    double result = dGram * 0.0022;

    return result.toStringAsFixed(4);

  }

  String _getKilogramToPound()
  {
    double dKilogram = double.parse(topVal);
    double result = dKilogram * 2.205;

    return result.toStringAsFixed(4);

  }

  String _getKilogramToGram()
  {
    double dKilogram = double.parse(topVal);
    double result = dKilogram * 1000;

    return result.toStringAsFixed(4);

  }

  String _getPoundToGram()
  {
    double dPound = double.parse(topVal);
    double result = dPound * 453.592;

    return result.toStringAsFixed(4);

  }

  String _getPoundToKilogram()
  {
    double dPound = double.parse(topVal);
    double result = dPound * 0.454;

    return result.toStringAsFixed(4);

  }

}   // Class ends