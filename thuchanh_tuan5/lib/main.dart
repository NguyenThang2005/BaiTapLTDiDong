import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// =======================
/// APP ROOT
/// =======================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// =======================
/// SCREEN 1 - HOME
/// =======================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose List Type"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Button Column
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(260, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListPage(title: "Column"),
                  ),
                );
              },
              child: const Text(
                "Column (1,000,000 items)",
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 16),

            /// Button LazyColumn
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: const Size(260, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ListPage(title: "LazyColumn"),
                  ),
                );
              },
              child: const Text(
                "LazyColumn (1,000,000 items)",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// SCREEN 2 - LIST PAGE
/// =======================
class ListPage extends StatelessWidget {
  final String title;
  const ListPage({super.key, required this.title});

  static const int itemCount = 1000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            color: Colors.lightBlue.shade50,
            child: ListTile(
              leading: Text(
                "${index + 1}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: const Text(
                "The only way to do great work",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: const Text(
                "is to love what you do.",
                style: TextStyle(fontSize: 12),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          );
        },
      ),
    );
  }
}
