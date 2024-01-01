import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _weightFocusNode = FocusNode();
  final _heightFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();

  double _weight = 0.0;
  double _height = 0.0;
  double _bmi = 0.0;
  String? _gender;

  void _setWeight(String weight) {
    setState(() {
      _weight = double.tryParse(weight) ?? 0.0;
    });
  }

  void _setHeight(String height) {
    setState(() {
      _height = double.tryParse(height) ?? 0.0;
    });
  }

  void _calculateBMI() {
    setState(() {
      _bmi = (_weight / pow(_height, 2)) * 10000;
    });

    if (_bmi < 18.5) {
      _showDialog('You are underweight!');
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      _showDialog('You are having normal weight. Well done!');
    } else if (_bmi >= 25 && _bmi <= 29.9) {
      _showDialog('You are overweight!');
    } else if (_bmi >= 30) {
      _showDialog('You are obese. Please watch your diet!');
    }
  }

  void _showDialog(String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("BMI Status", textAlign: TextAlign.center),
          content: Text(status),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _weightFocusNode.dispose();
    _heightFocusNode.dispose();
    _genderFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          //Scrollable to remove overflow error on keyboard
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    focusNode: _weightFocusNode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Weight (kg)',
                    ),
                    onChanged: (text) {
                      _setWeight(text);
                    },
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      //checks if input is empty or not a number
                      if (value == null || value.isEmpty) {
                        return 'Please enter your weight';
                      } else if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: TextFormField(
                    focusNode: _heightFocusNode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Height (cm)',
                    ),
                    onChanged: (text) {
                      _setHeight(text);
                    },
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      //checks if input is empty or not a number
                      if (value == null || value.isEmpty) {
                        return 'Please enter your height';
                      } else if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gender',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Male',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          const Text('Male'),
                          Radio<String>(
                            value: 'Female',
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = value;
                              });
                            },
                          ),
                          const Text('Female'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //checks gender has been selected
                        if (_gender == null) {
                          _showDialog('Please select a gender');
                        } else {
                          _calculateBMI();
                        }
                      } else {
                        if (_weightFocusNode.hasFocus) {
                          _weightFocusNode.requestFocus();
                        } else if (_heightFocusNode.hasFocus) {
                          _heightFocusNode.requestFocus();
                        } else if (_genderFocusNode.hasFocus) {
                          _genderFocusNode.requestFocus();
                        }
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(_bmi.toStringAsFixed(2)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
