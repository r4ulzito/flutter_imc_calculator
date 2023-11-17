import 'dart:math';

class BMIController {
  static BMIController instance = BMIController();

  int _weight = 0;
  int _height = 0;
  double _bmi = 0;
  String _categorie = "";

  bool validaFormulario() {
    if (_weight <= 0 || _height <= 0) {
      return true;
    } else {
      return false;
    }
  }

  String _validaCategoria(double bmi) {
    if (bmi <= 18.5) {
      return "you're underweight";
    } else if (bmi > 18.5 && bmi <= 24.9) {
      return "you're normal";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "you're overweight";
    } else {
      return "obesity";
    }
  }

  void calculaBMI() {
    _bmi = (_weight / pow((_height / 100), 2));

    _categorie = _validaCategoria(_bmi);

    _weight = 0;
    _height = 0;
  }

  void setWeight(int w) {
    _weight = w;
  }

  void setHeight(int h) {
    _height = h;
  }

  String getBMI() {
    return double.parse(_bmi.toStringAsFixed(1)).toString();
  }

  String getCategorie() {
    return _categorie;
  }
}
