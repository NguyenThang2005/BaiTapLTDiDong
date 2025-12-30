import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Column")),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            1000000,
                (index) => Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              color: Colors.blue.shade100,
              child: Text(
                "Item ${index + 1}\nThe only way to do great work is to love what you do.",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
