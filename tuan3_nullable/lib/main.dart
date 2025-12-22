import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AgeScreen(),
    );
  }
}

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int? age; // nullable
  String message = "";

  void checkAge() {
    message = "Tuổi của bạn: ${age ?? "Chưa nhập"}";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nullable")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Nhập tuổi",
              ),
              onChanged: (value) {
                age = int.tryParse(value); // có thể null
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: checkAge,
              child: const Text("Kiểm tra"),
            ),
            const SizedBox(height: 16),
            Text(message),
          ],
        ),
      ),
    );
  }
}
