import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/auth/x_auths.dart';
import '../pages/cart/x_carts.dart';
import '../pages/x_pages.dart';

class AppRouter {
  final router = GoRouter(
    // initialLocation: '/intro',
    initialLocation: '/signin',
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
          name: 'dashboard',
          path: '/dashboard',
          builder: (context, state) {
            final tab = 0;
            return DashboardPage(
              currentTab: tab,
            );
          },
          routes: [
            // GoRoute(
            //   name: 'productDetail',
            //   path: '/productDetailPath',
            //   builder: (context, state) {
            //     final args = state.extra as ProductModel;
            //     return ProductDetailPage(data: args);
            //   },
            // ),
            GoRoute(
              name: 'cart',
              path: 'cart',
              builder: (context, state) => const CartPage(),
            ),
            //     GoRoute(
            //       name: RouteConstants.address,
            //       path: RouteConstants.addressPath,
            //       builder: (context, state) => const AddressPage(),
            //       routes: [
            //         GoRoute(
            //           name: RouteConstants.addAddress,
            //           path: RouteConstants.addAddressPath,
            //           builder: (context, state) => const AddAddressPage(),
            //         ),
            //         GoRoute(
            //           name: RouteConstants.editAddress,
            //           path: RouteConstants.editAddressPath,
            //           builder: (context, state) {
            //             final args = state.extra as AddressModel;
            //             return EditAddressPage(data: args);
            //           },
            //         ),
            //         GoRoute(
            //           name: RouteConstants.orderDetail,
            //           path: RouteConstants.orderDetailPath,
            //           builder: (context, state) => const OrderDetailPage(),
            //           routes: [
            //             GoRoute(
            //               name: RouteConstants.paymentDetail,
            //               path: RouteConstants.paymentDetailPath,
            //               builder: (context, state) => const PaymentDetailPage(),
            //               routes: [
            //                 GoRoute(
            //                   name: RouteConstants.trackingOrder,
            //                   path: RouteConstants.trackingOrderPath,
            //                   builder: (context, state) => const TrackingOrderPage(),
            //                   routes: [
            //                     GoRoute(
            //                       name: RouteConstants.shippingDetail,
            //                       path: RouteConstants.shippingDetailPath,
            //                       builder: (context, state) =>
            //                           const ShippingDetailPage(),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ]),
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
