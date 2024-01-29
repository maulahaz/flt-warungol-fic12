import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/auth/x_auths.dart';
import '../pages/cart/x_carts.dart';
import '../pages/order/x_orders.dart';
import '../pages/x_pages.dart';

class AppRouter {
  final router = GoRouter(
    // initialLocation: '/intro',
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        name: 'intro',
        path: '/intro',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        name: 'signin',
        path: '/signin',
        builder: (context, state) => SigninPage(),
      ),
      GoRoute(
        name: 'signup',
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        name: 'profile',
        path: '/profile',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        name: 'dashboard',
        path: '/dashboard',
        builder: (context, state) {
          final tab = 0;
          return DashboardPage(
            currentTab: tab,
          );
        },
        routes: [
          GoRoute(
            name: 'cart',
            path: 'cart',
            builder: (context, state) => const CartPage(),
            routes: [
              GoRoute(
                name: 'orderDetail',
                path: 'order-detail',
                builder: (context, state) => const OrderDetailPage(),
              )
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}
