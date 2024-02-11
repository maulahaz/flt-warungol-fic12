import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/x_pages.dart';
import '../pages/address/x_addresses.dart';
import '../pages/auth/x_auths.dart';
import '../pages/cart/x_carts.dart';
import '../pages/order/x_orders.dart';
import '../pages/payment/x_payments.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: '/intro',
    // initialLocation: '/root',
    routes: [
      GoRoute(
        name: 'intro',
        path: '/intro',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        name: 'signin',
        path: '/signin',
        builder: (context, state) => SigninPage(),
        routes: [
          GoRoute(
            name: 'signup',
            path: 'signup',
            builder: (context, state) => SignupPage(),
          ),
        ],
      ),
      GoRoute(
        name: 'root',
        path: '/root',
        builder: (context, state) {
          final tab = 0;
          return DashboardPage(currentTab: tab);
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
                  routes: [
                    GoRoute(
                        name: 'payment',
                        path: 'payment',
                        builder: (context, state) => const PaymentPage(),
                        routes: [
                          // GoRoute(
                          //   name: 'paymentWaiting',
                          //   path: 'payment-waiting',
                          //   builder: (context, state) => PaymentWaitingPage(),
                          // ),
                          // GoRoute(
                          //   name: 'trackingOrder',
                          //   path: 'tracking-order',
                          //   builder: (context, state) => TrackingOrderPage(),
                          // routes: [
                          //   GoRoute(
                          //     name: 'shippingDetail',
                          //     path: 'shipping-detail',
                          //     builder: (context, state) => const ShippingDetailPage(),
                          //   ),
                          // ],
                          // ),
                        ])
                  ])
            ],
          ),
          GoRoute(
            name: 'address',
            path: 'address',
            builder: (context, state) => const AddressPage(),
            routes: [
              GoRoute(
                name: 'addressAdd',
                path: 'address-add',
                builder: (context, state) => const AddressAddPage(),
              ),
              GoRoute(
                name: 'addressEdit',
                path: 'address-edit',
                builder: (context, state) => const AddressEditPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        name: 'profile',
        path: '/profile',
        builder: (context, state) => SignupPage(),
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
