import 'package:flutter/material.dart';

class BoxLayoutScreen extends StatelessWidget {
  const BoxLayoutScreen({super.key});

  Widget buildBox(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Box Layout"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildBox(Colors.blue.shade200, 200),
            Positioned(
              top: 20,
              left: 20,
              child: buildBox(Colors.blue.shade500, 100),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: buildBox(Colors.blue.shade300, 80),
            ),
          ],
        ),
      ),
    );
  }
}
