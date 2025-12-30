import 'package:flutter/material.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: const Text("Tôi đồng ý với điều khoản"),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            const SizedBox(height: 12),
            Text(
              isChecked ? "Đã chọn" : "Chưa chọn",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isChecked ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
