import 'dart:io';

class Calculation {
  List<num> _inputList = []; //Private variable

  List<num> get inputList => _inputList; //Getter

  set inputList(List<num> value) {
    //Setter
    _inputList = value;
  }

  void readInput() {
    //Method for user input
    stdout.write("Input: ");
    var input = stdin.readLineSync();

    while (true) {
      try {
        _inputList = input!.split(',').map((e) => num.parse(e.trim())).toList();
        break; // If the input is valid, break the loop
      } on FormatException {
        print('Invalid input. Please enter comma-separated numbers only.');
      }
      stdout.write("Input: ");
      input = stdin.readLineSync();
    }
  }

  num calculateSummation() {
    return _inputList.reduce((a, b) => a + b);
  }

  num calculateAverage() {
    return calculateSummation() / _inputList.length;
  }

  num calculateDivision() {
    return _inputList.reduce((a, b) => a / b);
  }

  num calculateSubtraction() {
    return _inputList.reduce((a, b) => a - b);
  }

  num calculateMultiplication() {
    return _inputList.reduce((a, b) => a * b);
  }

  List<num> findPrimeNumbers() {
    //Find prime numbers and put into a list
    return _inputList.where((number) {
      if (number < 2 || number % 1 != 0) {
        return false;
      }
      for (var i = 2; i <= number / 2; i++) {
        if (number % i == 0) {
          return false;
        }
      }
      return true;
    }).toList();
  }
}
