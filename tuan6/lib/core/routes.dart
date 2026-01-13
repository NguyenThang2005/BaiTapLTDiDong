import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';

class Routes {
  static const login = '/login';
  static const profile = '/profile';

  static final routes = <String, WidgetBuilder>{
    login: (context) => const LoginScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
