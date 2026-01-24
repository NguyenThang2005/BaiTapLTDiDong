import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantCard extends StatelessWidget {
  final int id;
  final String name;
  final String cuisine;

  const RestaurantCard({
    super.key,
    required this.id,
    required this.name,
    required this.cuisine,
  });

  static const List<String> _images = [
    'assets/images/restaurant_1.jpg',
    'assets/images/restaurant_2.jpg',
    'assets/images/restaurant_3.jpg',
    'assets/images/restaurant_4.jpg',
    'assets/images/restaurant_5.jpg',
    'assets/images/restaurant_6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final imagePath = _images[(id - 1) % _images.length];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.push('/restaurant/$id'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                imagePath,
                key: ValueKey(imagePath),
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cuisine,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
