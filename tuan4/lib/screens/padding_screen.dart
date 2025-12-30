import 'package:flutter/material.dart';

class PaddingScreen extends StatelessWidget {
  const PaddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Padding"),
      ),
      body: Center(
        child: Container(
          color: Colors.blue.shade100,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "This text has padding",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
