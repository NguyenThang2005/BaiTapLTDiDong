import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Elevated Button"),
            ),
            const SizedBox(height: 12),

            OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined Button"),
            ),
            const SizedBox(height: 12),

            TextButton(
              onPressed: () {},
              child: const Text("Text Button"),
            ),
            const SizedBox(height: 12),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
            const SizedBox(height: 12),

            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
