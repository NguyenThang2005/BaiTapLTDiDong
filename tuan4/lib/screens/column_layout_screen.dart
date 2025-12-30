import 'package:flutter/material.dart';

class ColumnLayoutScreen extends StatelessWidget {
  const ColumnLayoutScreen({super.key});

  Widget buildBox(Color color) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Column Layout"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildBox(Colors.blue.shade200),
            const SizedBox(height: 12),
            buildBox(Colors.blue.shade500),
            const SizedBox(height: 12),
            buildBox(Colors.blue.shade200),
            const SizedBox(height: 12),
            buildBox(Colors.blue.shade500),
          ],
        ),
      ),
    );
  }
}
