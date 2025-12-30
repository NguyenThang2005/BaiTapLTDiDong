import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TextField")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Thông tin nhập",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  input = value;
                });
              },
            ),
            const SizedBox(height: 12),
            const Text(
              "Tự động cập nhật dữ liệu theo textfield",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 12),
            Text(input,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
