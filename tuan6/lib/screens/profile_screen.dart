import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../core/firebase_service.dart';
import '../core/routes.dart';
import '../core/analytics_service.dart';
import '../core/realtime_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    AnalyticsService.logScreen('ProfileScreen');

    // ✅ ĐẢM BẢO USER ĐÃ LOGIN
    Future.microtask(() async {
      final user = _auth.currentUser;
      if (user != null) {
        await RealtimeService().saveUser();
        await RealtimeService().setOnline(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;

    if (user == null) {
      // ⚠️ fallback nếu user null
      return const Scaffold(
        body: Center(child: Text('User not logged in')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 32),
            _field(label: 'Name', value: user.displayName ?? 'Unknown'),
            const SizedBox(height: 16),
            _field(label: 'Email', value: user.email ?? ''),
            const SizedBox(height: 16),
            _field(
              label: 'Date of Birth',
              value: '23/05/1995',
              icon: Icons.keyboard_arrow_down,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  await RealtimeService().setOnline(false);
                  await FirebaseService().signOut();
                  AnalyticsService.analytics.logEvent(name: 'logout');

                  Navigator.pushReplacementNamed(
                    context,
                    Routes.login,
                  );
                },
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field({
    required String label,
    required String value,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: value,
            suffixIcon: icon != null ? Icon(icon) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
