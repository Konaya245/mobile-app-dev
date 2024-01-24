//Muhammad Zaidi bin Abdul Razak 1820833
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PasswordAuthenticator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PasswordAuthenticator extends StatefulWidget {
  const PasswordAuthenticator({super.key});

  @override
  _PasswordAuthenticatorState createState() => _PasswordAuthenticatorState();
}

class _PasswordAuthenticatorState extends State<PasswordAuthenticator> {
  String word = '';
  int lettersCount = 0;
  int symbolsCount = 0;
  int numbersCount = 0;
  bool isValid = false;

  void analyzePassword() {
    List<String> letters = word.split('');
    isValid = true;

    // Check if password begins with letters (condition a)
    if (!letters[0].toLowerCase().contains(RegExp('[a-z]'))) {
      isValid = false;
    }
    lettersCount =
        letters.where((letter) => letter.contains(RegExp('[a-zA-Z]'))).length;

    // Check if password contains at least 2 numbers at any position (condition b)
    numbersCount =
        letters.where((letter) => letter.contains(RegExp('[0-9]'))).length;
    if (numbersCount < 2) {
      isValid = false;
    }

    // Check if password contains valid symbols and only 1 symbol (condition c)
    String validSymbols = '~!@#\$%^&*';
    String validCharacters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789$validSymbols';
    for (String letter in letters) {
      if (!validCharacters.contains(letter)) {
        isValid = false;
        break;
      }
    }
    symbolsCount =
        letters.where((letter) => validSymbols.contains(letter)).length;
    if (symbolsCount > 1) {
      isValid = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Password Authenticator',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Password'),
                const SizedBox(width: 100.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          word = value;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(6.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: analyzePassword,
                  child: const Text('Authenticate'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Letters'),
                Text(': $lettersCount'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Symbols'),
                Text(': $symbolsCount'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Numbers'),
                Text(': $numbersCount'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Status'),
                Text(': ${isValid ? 'Valid' : 'Invalid'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
