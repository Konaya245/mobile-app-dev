/* Q1
void main() {
  var z = const [];

  z.add(12);

  z.add(24);

  z.add(25);

  print("This is the contents of z $z");
}
*/
// the error states that the list is constant and cannot be changed

/* Q2
import 'dart:io';
void main() {
  List<String?> fullName = [];
  bool i = true;
  while (i) {
    print("Enter your full name:");
    fullName.add(stdin.readLineSync());

    print("Is that all?");
    var answer = stdin.readLineSync();
    if (answer == "yes") {
      i = false;
    }
  }
  print(fullName);
}
*/

/* Q3
import 'dart:io';

void main() {
  Set<String?> fullName = {};
  bool i = true;
  while (i) {
    print("Enter your full name:");
    fullName.add(stdin.readLineSync());

    print("Is that all?");
    var answer = stdin.readLineSync();
    if (answer == "yes") {
      i = false;
    }
  }
  print(fullName);
}
*/

/* Q4
import 'dart:io';

void main() {
  Map<int?, String?> fullName = {};
  bool i = true;
  
  while (i) {
    print("Enter your full name:");
    var count = fullName.length + 1;
    fullName[count] = stdin.readLineSync();

    print("Is that all?");
    var answer = stdin.readLineSync();
    if (answer == "yes") {
      i = false;
    }
  }
  fullName.forEach((count, name) => print('$count is ${name}'));
}
*/

// q5 Modify the above code and create a separate function or method for each data type together the display function. For example:
import 'dart:io';

void main() {
  display();
}

dynamic dynamicvariables() {}

int integervariables() {}

void display() {
  dynamicvariables();

  integervariables();

  print();
}
