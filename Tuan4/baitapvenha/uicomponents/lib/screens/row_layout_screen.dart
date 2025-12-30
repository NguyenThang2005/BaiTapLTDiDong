import 'package:flutter/material.dart';

class RowLayoutScreen extends StatelessWidget {
  const RowLayoutScreen({super.key});

  Widget buildBox(Color color) {
    return Container(
      width: 70,
      height: 50,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row Layout")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildBox(Colors.blue.shade200),
                  buildBox(Colors.blue.shade500),
                  buildBox(Colors.blue.shade200),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
