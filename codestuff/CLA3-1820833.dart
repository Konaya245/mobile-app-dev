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
      home: WordAnalyzer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WordAnalyzer extends StatefulWidget {
  const WordAnalyzer({super.key});

  @override
  _WordAnalyzerState createState() => _WordAnalyzerState();
}

class _WordAnalyzerState extends State<WordAnalyzer> {
  String word = '';
  int consonants = 0;
  int vowels = 0;
  int characters = 0;
  bool isPalindrome = false;

  void analyzeWord() {
    List<String> letters = word.split('');
    characters = letters.length;
    consonants = 0;
    vowels = 0;
    isPalindrome = true;

    for (String letter in letters) {
      if (letter.toLowerCase().contains(RegExp('[aeiou]'))) {
        vowels++;
      } else {
        consonants++;
      }
    }

    String reversedWord = letters.reversed.join();
    if (word.toLowerCase() != reversedWord.toLowerCase()) {
      isPalindrome = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('A Word Analyzer'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('Word'),
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
                  onPressed: analyzeWord,
                  child: const Text('Analyze'),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Word'),
                Text(':$word'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('No of Consonants'),
                Text(': $consonants'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('No of Vowels'),
                Text(': $vowels'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('No of Characters'),
                Text(': $characters'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Palindrome'),
                Text(': ${isPalindrome ? 'Yes' : 'No'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
