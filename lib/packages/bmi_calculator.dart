import 'dart:math';

class BmiCalculator {
  final int height;
  final int weight;
  late double _bmi = 0;

  BmiCalculator({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBmi() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 29.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    }

    return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi >= 29.0) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    }

    return 'You have a lower than normal body weight. Try can eat a bit more.';
  }
}
