import 'calculation.dart';

void main() {
  Calculation calculation = Calculation(); //create object
  calculation.readInput(); //call method for userinput

  var summation = calculation.calculateSummation();
  print('Summation: $summation');

  var average = calculation.calculateAverage();
  print('Average: $average');

  var division = calculation.calculateDivision();
  print('Division: $division');

  var subtraction = calculation.calculateSubtraction();
  print('Subtraction: $subtraction');

  var multiplication = calculation.calculateMultiplication();
  print('Multiplication: $multiplication');

  var primeNumbers = calculation.findPrimeNumbers();
  var primeCount = primeNumbers.length;
  print('Prime Number(s): $primeCount');
}
