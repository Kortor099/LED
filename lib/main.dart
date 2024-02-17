import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LED Matrix Display'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LedDisplay(),
            ],
          ),
        ),
      ),
    );
  }
}

class LedDisplay extends StatefulWidget {
  @override
  _LedDisplayState createState() => _LedDisplayState();
}

class _LedDisplayState extends State<LedDisplay> {
  int _number = 0;

  void _incrementNumber() {
    setState(() {
      if (_number == 99) {
        _number = 0;
      } else {
        _number++;
      }
    });
  }

  void _decrementNumber() {
    setState(() {
      if (_number == 0) {
        _number = 99;
      } else {
        _number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: _decrementNumber,
            ),
            SizedBox(width: 16),
            _buildDigit(_number ~/ 10), // Tens digit
            SizedBox(width: 16),
            _buildDigit(_number % 10), // Ones digit
            SizedBox(width: 16),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _incrementNumber,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDigit(int digit) {
    return Column(
      children: List.generate(
        7,
        (index) => _buildRow(digit, index),
      ),
    );
  }

  Widget _buildRow(int digit, int rowIndex) {
    List<int> patterns = _digitPatterns[digit][rowIndex];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => _buildDot(patterns[index]),
      ),
    );
  }

  Widget _buildDot(int pattern) {
    final color = pattern == 1 ? Colors.red : Colors.grey[300];
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  final List<List<List<int>>> _digitPatterns = [
    // Patterns for each digit
    [
      // 0
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 1, 1, 1, 1],
    ],
    [
      // 1
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [1, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Add patterns for digits 2 through 9 similarly
    // Patterns for digit 2
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Patterns for digit 3
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 1, 1, 1, 1],
    ],
    // Patterns for digit 4
    [
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
    ],
    // Patterns for digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 1, 1, 1, 1],
    ],
    // Patterns for digit 6
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 1, 1, 1, 1],
    ]
  ];
}
