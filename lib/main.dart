import 'package:flutter/material.dart';
import 'package:mid_exam_shop_app/features/forgotPassword/view/forgot_password_screen.dart';
import 'package:mid_exam_shop_app/features/prodect/view/products_screen.dart';

import 'features/login/view/login_screen.dart';
import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.login,

      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.forgotPassword: (context) => const ForgotPasswordScreen(),
        AppRoutes.products: (context) => const ProductsScreen(),
        AppRoutes.productDetails: (context) => const ProductsScreen(),
      },
    );
  }
}
