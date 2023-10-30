/*void main(){

var firstname = "zaidi";

dynamic lastname ="razak";



int year = 2023;

int birthyear = 2001 ;

int age = year - birthyear;



double cgpa = 3.68;

String address = "selangor";



print("My name is $firstname $lastname. I am $age this year. I am staying at $address. My CGPA is $cgpa");

}
*/
/* class activity part 2
void main(){

 const x = 3.142;

 final y;

 y = 3.142;

 print("x = $x and y = $y");

}
*/

import 'dart:io';

void main() {
/* stdout.write("Input:");

  var input = stdin.readLineSync();

  stdout.write(input + "\n");*/

  stdout.write("First Name:");
  var firstname = stdin.readLineSync();
  stdout.write(firstname! + "\n");

  stdout.write("Last Name:");
  var lastname = stdin.readLineSync();
  stdout.write(lastname! + "\n");

  stdout.write("Birth year:");
  var birthyear = stdin.readLineSync();
  stdout.write(birthyear! + "\n");

  stdout.write("Address:");
  var address = stdin.readLineSync();
  stdout.write(address! + "\n");
}

// single question mark allow asign variable without value. double is a ternary operator. exclamation mark is a null assertion operator. 
// typecasting is a way to convert a variable from one data type to another data type.