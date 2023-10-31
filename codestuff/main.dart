//test chamber + notas
void main() {
  Map<int, String> fruits = {
    101: 'apple',
    102: 'orange',
    103: 'pear',
  };
  fruits[104] = 'watermelon';
  print(fruits); //print maps
  fruits.forEach((code, fruit) =>
      print('$code is ${fruit}')); //print maps with for each loop
  print(fruits.keys); //print keys
  fruits.remove(104); //clear map
  print(fruits.keys); //print keys
}

/*notes 31/10 
fixed list using number is kiddy stuff we use generics? unlimited now.
prefill the list to make a list fixed size

set = unordered object that stores unit values. no duplicates different from array. 
e.g. matric numbers and names.
set uses curly braces whereas list uses square brackets. 

must declare variable e.g. <String> infront of the curly braces to make it a set, else it will be a map.
=> fat arrow function is a shorthand for one line functions.
arrow function simplest for one line functions when you need to return value.


A standard function in dart must consist the following elements:  
Data_Type Function_Name (parameters){    
  //Operation on the given parameter;    
  //Optional Return of the operation’s result; 
}

square bracket for optional parameters.
variable assignment in function parameter makes it the default parameter.
eg. bool threshold(int i =1){}

*/
