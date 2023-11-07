//test chamber + notas
void main() {
  Student a;
  //print(a); gives null here
  a = new Student();
  print(a);

  a.name = "John"; //can't if class variable private encapsulation
  print(a);
  print(a.getName());
  a.display();

  a.setName("Mary"); //need to set like this
  a.display();
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
