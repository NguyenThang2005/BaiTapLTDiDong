import 'package:flutter/material.dart';
import 'screens/menu_screen.dart';
import 'screens/column_screen.dart';
import 'screens/lazy_column_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Column vs LazyColumn',
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuScreen(),
        '/column': (context) => const ColumnScreen(),
        '/lazy': (context) => const LazyColumnScreen(),
      },
    );
  }
}
