import 'package:flutter/material.dart';

class PasswordFieldScreen extends StatefulWidget {
  const PasswordFieldScreen({super.key});

  @override
  State<PasswordFieldScreen> createState() => _PasswordFieldScreenState();
}

class _PasswordFieldScreenState extends State<PasswordFieldScreen> {
  String input = "";
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PasswordField"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText: isHidden,
              onChanged: (value) {
                setState(() {
                  input = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Nhập mật khẩu",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Tự động cập nhật dữ liệu theo password field",
              style: TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 12),
            Text(
              input,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
