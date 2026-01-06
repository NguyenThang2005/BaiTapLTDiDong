import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/primary_button.dart';
import 'verify_code_screen.dart';
import '../models/reset_data.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  ResetData? result; // ✅ DỮ LIỆU TRẢ VỀ

  bool isValidEmail(String email) {
    return RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(
                title: "Forget Password?",
                subtitle:
                "Enter your Email, we will send you a verification code.",
                showBack: false,
              ),
              const SizedBox(height: 30),

              /// EMAIL
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email không được để trống";
                  }
                  if (!isValidEmail(value)) {
                    return "Email không đúng định dạng";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              PrimaryButton(
                text: "Next",
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final data = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            VerifyCodeScreen(email: emailController.text),
                      ),
                    );

                    if (data != null && data is ResetData) {
                      setState(() {
                        result = data;
                      });
                    }
                  }
                },
              ),

              /// ✅ HIỂN THỊ THÔNG TIN SAU SUBMIT
              if (result != null) ...[
                const SizedBox(height: 40),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
                  "Submitted Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Text("Email: ${result!.email}"),
                Text("Verify Code: ${result!.code}"),
                Text("Password: ${result!.password}"),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
