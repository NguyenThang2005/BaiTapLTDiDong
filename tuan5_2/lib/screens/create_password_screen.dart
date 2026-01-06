import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/primary_button.dart';
import 'confirm_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  final String email;
  final String code;

  const CreatePasswordScreen({
    super.key,
    required this.email,
    required this.code,
  });

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final pass = TextEditingController();
  final confirm = TextEditingController();

  @override
  void dispose() {
    pass.dispose();
    confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Header(
              title: "Create new password",
              subtitle:
              "Your new password must be different from previously used password",
            ),
            const SizedBox(height: 30),

            TextField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: confirm,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Confirm Password",
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 30),

            PrimaryButton(
              text: "Next",
              onPressed: () async {
                if (pass.text.isEmpty || confirm.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Không được để trống mật khẩu"),
                    ),
                  );
                  return;
                }

                if (pass.text != confirm.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Mật khẩu không trùng nhau"),
                    ),
                  );
                  return;
                }

                final data = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ConfirmScreen(
                      email: widget.email,
                      code: widget.code,
                      password: pass.text,
                    ),
                  ),
                );

                if (data != null) {
                  Navigator.pop(context, data);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
