import 'dart:math';


class CalculateBrain {

  final int height;
  final int weight;
  double _bmi ;

  CalculateBrain({this.weight, this.height});

  String calculateBMI() {
    _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25 ) return 'OverWeight';
    if(_bmi >= 18.5 ) return 'Normal';
    if(_bmi < 25 ) return 'UnderWeight';
  }

  String getInterpretation() {
    if(_bmi >= 25 ) return 'You have a higher than normal body weight, Try to exercice more.';
    if(_bmi >= 18.5 ) return 'You have a normal body weight, Good job!';
    if(_bmi < 25 ) return 'You have a lower than normal body weight, Try to eat a bit more.';
  }

}