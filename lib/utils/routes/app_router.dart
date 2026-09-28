

import 'package:flutter/material.dart';
import 'package:mid_exam_shop_app/utils/routes/routes.dart';

import '../../features/forgotPassword/view/forgot_password_screen.dart';
import '../../features/login/view/login_screen.dart';
import '../../features/prodect/model/prodect.dart';
import '../../features/prodect/view/products_screen.dart';
import '../../features/productDetails/view/product_details_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case AppRoutes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
          settings: settings,
        );

      case AppRoutes.products:
        return MaterialPageRoute(
          builder: (_) => const ProductsScreen(),
          settings: settings,
        );

     // ...existing code...
      case AppRoutes.productDetails:
        final product = settings.arguments as Product?;
        if (product == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(body: Center(child: Text('Product not found'))),
          );
        }

        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(product: product),
          settings: settings,
        );
      // ...existing code...

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}