import 'dart:io';

void main() {
  stdout.write("Input: ");
  var input = stdin.readLineSync();
  
  // Split the input into a list
  List<num> inputList = [];
  while (true) {
  try {
    inputList = input!
        .split(',')
        .map((e) => num.parse(e.trim()))
        .toList();
    break;  // If the input is valid, break the loop
  } on FormatException {
    print('Invalid input. Please enter comma-separated numbers only.');
  }
  stdout.write("Input: ");
  input = stdin.readLineSync();
}
  
  // Calculate the summation of the input values
  var summation = inputList.reduce((a, b) => a + b);
  print('Summation: $summation');
  
  // Calculate the average of the input values
  var average = summation / inputList.length;
  print('Average: $average');
  
  // Calculate the division of the input values
  var division = inputList.reduce((a, b) => a / b);
  print('Division: $division');
  
  // Calculate the subtraction of the input values
  var subtraction = inputList.reduce((a, b) => a - b);
  print('Subtraction: $subtraction');
  
  // Calculate the multiplication of the input values
  var multiplication = inputList.reduce((a, b) => a * b);
  print('Multiplication: $multiplication');
  
  // Find the prime numbers in the input values
  var primeNumbers = inputList.where((number) {
    if (number < 2 || number % 1 != 0) { 
      return false;
    }
    for (var i = 2; i <= number / 2; i++) { 
      if (number % i == 0) { // 
        return false;
      }
    }
    return true;
  }).toList();
  var primeCount = primeNumbers.length;
  print('Prime Number(s): $primeCount'); //Number of prime numbers?
}
