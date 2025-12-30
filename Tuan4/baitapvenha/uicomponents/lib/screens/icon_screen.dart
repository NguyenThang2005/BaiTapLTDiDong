import 'package:flutter/material.dart';

class IconScreen extends StatelessWidget {
  const IconScreen({super.key});

  Widget buildIcon(IconData icon, Color color, String label) {
    return Column(
      children: [
        Icon(
          icon,
          size: 40,
          color: color,
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icons"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: [
            buildIcon(Icons.home, Colors.blue, "Home"),
            buildIcon(Icons.favorite, Colors.red, "Favorite"),
            buildIcon(Icons.settings, Colors.grey, "Settings"),
            buildIcon(Icons.person, Colors.green, "Profile"),
            buildIcon(Icons.email, Colors.orange, "Email"),
            buildIcon(Icons.camera_alt, Colors.purple, "Camera"),
          ],
        ),
      ),
    );
  }
}
