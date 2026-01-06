import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/primary_button.dart';
import '../models/reset_data.dart';

class ConfirmScreen extends StatelessWidget {
  final String email;
  final String code;
  final String password;

  const ConfirmScreen({
    super.key,
    required this.email,
    required this.code,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              title: "Confirm",
              subtitle: "Please confirm your information",
            ),
            const SizedBox(height: 30),

            Text("Email: $email"),
            Text("Verify Code: $code"),
            Text("Password: $password"),

            const Spacer(),

            PrimaryButton(
              text: "Submit",
              onPressed: () {
                Navigator.pop(
                  context,
                  ResetData(
                    email: email,
                    code: code,
                    password: password,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
