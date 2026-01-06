import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/primary_button.dart';
import 'create_password_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String email;
  const VerifyCodeScreen({super.key, required this.email});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final controllers = List.generate(5, (_) => TextEditingController());

  String get code => controllers.map((e) => e.text).join();

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
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
              title: "Verify Code",
              subtitle:
              "Enter the code we just sent you on your registered Email",
            ),
            const SizedBox(height: 30),

            /// OTP 5 ô
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (i) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: controllers[i],
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(counterText: ""),
                    onChanged: (v) {
                      if (v.isNotEmpty && i < 4) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (v.isEmpty && i > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                );
              }),
            ),

            const SizedBox(height: 30),

            PrimaryButton(
              text: "Next",
              onPressed: () async {
                if (code.length < 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Vui lòng nhập đủ 5 số"),
                    ),
                  );
                  return;
                }

                final data = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreatePasswordScreen(
                      email: widget.email,
                      code: code,
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
