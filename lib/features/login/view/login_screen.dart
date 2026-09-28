import 'package:flutter/material.dart';

import '../../../utils/regex.dart';
import '../../../utils/routes/routes.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please fill in all fields')));
    } else if (!AppRegex.email.hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid email')));
    } else if (!AppRegex.password.hasMatch(passwordController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid password')));
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.products);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 70),

              Image.asset("assets/icons/shop_bag.png", width: 150, height: 150),

              const SizedBox(height: 20),

              const Text('ShopApp', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

              const SizedBox(height: 8),

              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 5),

              const Text(
                'Sign in to continue',
                style: TextStyle(color: Color.fromARGB(255, 106, 105, 105)),
              ),

              const SizedBox(height: 35),

              CustomTextField(
                controller: emailController,
                hintText: 'Email',
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  if (!AppRegex.email.hasMatch(value)) {
                    return 'Enter a valid email';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  if (!AppRegex.password.hasMatch(value)) {
                    return 'Password must contain letters and numbers';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPassword);
                  },
                  child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFF0365E8))),
                ),
              ),

              const SizedBox(height: 15),

              CustomButton(text: 'Login', onPressed: login),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up', style: TextStyle(color: Color(0xFF0365E8))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
