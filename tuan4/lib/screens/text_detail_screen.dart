import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Detail")),
      body: Center(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 22, color: Colors.black),
            children: [
              const TextSpan(text: "The "),
              const TextSpan(
                  text: "quick ",
                  style: TextStyle(decoration: TextDecoration.lineThrough)),
              const TextSpan(
                  text: "Brown ",
                  style: TextStyle(color: Colors.orange)),
              const TextSpan(text: "fox jumps "),
              const TextSpan(
                  text: "over ",
                  style: TextStyle(fontStyle: FontStyle.italic)),
              const TextSpan(
                  text: "the ",
                  style: TextStyle(decoration: TextDecoration.underline)),
              const TextSpan(
                  text: "lazy dog.",
                  style: TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
        ),
      ),
    );
  }
}
