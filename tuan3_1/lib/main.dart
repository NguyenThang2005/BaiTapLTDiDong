import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// APP ROOT
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(),
    );
  }
}

/// ABSTRACT CLASS (Tính trừu tượng)
abstract class PaymentMethod {
  final String id;
  final String name;
  final String logoPath;

  PaymentMethod(this.id, this.name, this.logoPath);
}

/// INHERITANCE (Tính kế thừa)
class PaypalPayment extends PaymentMethod {
  PaypalPayment()
      : super('paypal', 'PayPal', 'assets/images/paypal.png');
}

class GooglePayPayment extends PaymentMethod {
  GooglePayPayment()
      : super('googlepay', 'Google Pay', 'assets/images/googlepay.png');
}

class ApplePayPayment extends PaymentMethod {
  ApplePayPayment()
      : super('applepay', 'Apple Pay', 'assets/images/applepay.png');
}

/// PAYMENT PAGE
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentMethod? selectedMethod;

  final List<PaymentMethod> methods = [
    PaypalPayment(),
    GooglePayPayment(),
    ApplePayPayment(),
  ];

  void selectMethod(PaymentMethod method) {
    setState(() {
      selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),

          selectedMethod == null
              ? Column(
            children: [
              Image.asset(
                'assets/images/wallet.png',
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
            ],
          )
              : Column(
            children: [
              Image.asset(
                selectedMethod!.logoPath,     //Tính đa hình
                height: 80,
              ),
              const SizedBox(height: 10),
            ],
          ),

          const SizedBox(height: 80),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              thickness: 1,
              height: 5,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 40),

          /// PAYMENT LIST
          ...methods.map(
                (method) => PaymentItem(
              method: method,
              isSelected: selectedMethod?.id == method.id,
              onTap: () => selectMethod(method),
            ),
          ),

          const Spacer(),

          /// CONTINUE BUTTON
          if (selectedMethod != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Đã chọn: ${selectedMethod!.name}',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// PAYMENT ITEM (Tính đóng gói)
class PaymentItem extends StatelessWidget {
  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentItem({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 12),
            Text(
              method.name,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Image.asset(
              method.logoPath,
              height: 26,
            ),
          ],
        ),
      ),
    );
  }
}
