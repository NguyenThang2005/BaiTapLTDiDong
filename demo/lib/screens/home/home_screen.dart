import 'package:flutter/material.dart';
import '../../auth/auth_service.dart';
import '../../widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  final AuthService auth;

  const HomeScreen({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: auth.logout,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          final id = index + 1;
          return RestaurantCard(
            id: id,
            name: 'Restaurant $id',
            cuisine: 'Italian • \$\$',
          );
        },
      ),
    );
  }
}
