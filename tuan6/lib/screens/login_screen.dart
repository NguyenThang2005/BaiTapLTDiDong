import 'package:flutter/material.dart';
import '../core/firebase_service.dart';
import '../core/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ LOGO ẢNH
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/uth_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'SmartTasks',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'A simple and efficient to-do app',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 32),

            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Ready to explore? Log in to get started.',
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade50,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () async {
                  final user =
                  await FirebaseService().signInWithGoogle();
                  if (user != null) {
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.profile,
                    );
                  }
                },
                child: const Text(
                  'SIGN IN WITH GOOGLE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              '© UTHSmartTasks',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
