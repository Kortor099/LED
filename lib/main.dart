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
          centerTitle: true,
          title: Text(
            'CP-SU LED MATRIX',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 236, 172, 232),
        ),
        backgroundColor: Color.fromARGB(255, 245, 226, 244),
        body: LedDisplay(),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Container(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Color.fromARGB(255, 236, 172, 232),
              ),
              child: Icon(
                Icons.arrow_drop_up,
                size: 80,
                //color: Colors.white, // Set the color of the arrow icon
              ),
            ),
            onPressed: _decrementNumber,
          ),
          Container(
            // Wrap LED display with Container
            padding: EdgeInsets.all(50), // Add padding for space
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 236, 172, 232),
                  width: 13), // Border properties
              color: Color.fromARGB(255, 26, 26, 26),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDigit(_number ~/ 10), // Tens digit
                SizedBox(width: 16),
                _buildDigit(_number % 10), // Ones digit
              ],
            ),
          ),
          IconButton(
            icon: Container(
              decoration: ShapeDecoration(
                shape: CircleBorder(),
                color: Color.fromARGB(255, 236, 172, 232),
              ),
              child: Icon(
                Icons.arrow_drop_down,
                size: 80,
                //color: Colors.white, // Set the color of the arrow icon
              ),
            ),
            onPressed: _decrementNumber,
          ),
        ],
      ),
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
    final color = pattern == 1
        ? Color.fromARGB(255, 18, 243, 228)
        : Color.fromARGB(255, 57, 56, 56);
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
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    [
      // 1
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];
}
