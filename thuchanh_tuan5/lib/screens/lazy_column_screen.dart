import 'package:flutter/material.dart';

class LazyColumnScreen extends StatelessWidget {
  const LazyColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LazyColumn")),
      body: ListView.builder(
        itemCount: 1000000,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Item ${index + 1}\nThe only way to do great work is to love what you do.",
            ),
          );
        },
      ),
    );
  }
}
