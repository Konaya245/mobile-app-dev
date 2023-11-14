import 'dart:io';

void main() {
  
  String? name;
  Person myPerson = Person("",0);
  myPerson.setName(name ?? 'Poopy'); //if name is null, set name to default 'Poopy'
  print(myPerson.getName());
}

class Person {
  String _name;
  int _age;

  Person(String name, int age) : _name = name, _age = age;

  String getName() {
    return _name;
  }

  int getAge() {
    return _age;
  }

  void setName(String name) {
    _name = name;
  }

  void setAge(int age) {
    _age = age;
  }

  
}
