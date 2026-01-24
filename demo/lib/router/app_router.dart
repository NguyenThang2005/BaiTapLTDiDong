import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_service.dart';
import '../screens/login/login_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/restaurant/restaurant_detail_screen.dart';

GoRouter createRouter(AuthService auth) {
  return GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: auth,

    redirect: (context, state) {
      final isLoggedIn = auth.loggedIn;
      final isLoggingIn = state.uri.path == '/login';

      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }

      if (isLoggedIn && isLoggingIn) {
        return '/';
      }

      return null;
    },

    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) =>
            LoginScreen(auth: auth),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) =>
            HomeScreen(auth: auth),
        routes: [
          GoRoute(
            path: 'restaurant/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return RestaurantDetailScreen(id: id);
            },
          ),
        ],
      ),
    ],
  );
}
