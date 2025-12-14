import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Practice03Page(),
    );
  }
}

class Practice03Page extends StatefulWidget {
  const Practice03Page({super.key});

  @override
  State<Practice03Page> createState() => _Practice03PageState();
}

class _Practice03PageState extends State<Practice03Page> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _operator = '+';
  double _result = 0;

  void _calculate() {
    final double a = double.tryParse(_num1Controller.text) ?? 0;
    final double b = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      switch (_operator) {
        case '+':
          _result = a + b;
          break;
        case '-':
          _result = a - b;
          break;
        case '*':
          _result = a * b;
          break;
        case '/':
          _result = b != 0 ? a / b : 0;
          break;
      }
    });
  }

  Widget _operatorButton(String op, Color color) {
    final bool isSelected = _operator == op;

    return GestureDetector(
      onTap: () {
        setState(() {
          _operator = op;
        });
        _calculate();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
        child: Center(
          child: Text(
            op,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Thực hành 03',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            /// Số thứ nhất
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              onChanged: (_) => _calculate(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Các phép toán
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _operatorButton('+', Colors.red),
                _operatorButton('-', Colors.orange),
                _operatorButton('*', Colors.deepPurple),
                _operatorButton('/', Colors.black),
              ],
            ),

            const SizedBox(height: 16),

            /// Số thứ hai
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              onChanged: (_) => _calculate(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// Kết quả
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Kết quả: ${_result.toString()}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
