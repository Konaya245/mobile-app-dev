//test chamber + notas
void main() {
  Student a;
  //print(a); gives null here
  a = new Student();
  print(a);
}

class Student {
  //properties
  var name; //constructor
  Student() {
    name = "";
  } //setter
  void setName(String name) {
    this.name = name;
  } //getter

  String getName() {
    return name;
  } //function

  void display() {
    print(getName());
  }
}
