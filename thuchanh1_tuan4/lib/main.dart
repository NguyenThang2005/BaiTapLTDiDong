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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Hello";

  void sayHi() {
    setState(() {
      message = "I'm Nguyen Huu Thang";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextView 1 - Tiêu đề
            const Text(
              "My First App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            // TextView 2 - Nội dung thay đổi
            Text(
              message,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 40),

            // Button
            ElevatedButton(
              onPressed: sayHi,
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              ),
              child: const Text("Say Hi!"),
            ),
          ],
        ),
      ),
    );
  }
}
