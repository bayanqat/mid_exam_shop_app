import 'package:flutter/material.dart';

import '../../../utils/widgets/custom_app_bar.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot Password', showBackButton: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
        
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFE5F1FF)),
              child: const Icon(Icons.lock_outline, size: 50, color: Color(0xFF147DEB)),
            ),
        
            const SizedBox(height: 30),
        
            const Text(
              'Reset Your Password',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
        
            const SizedBox(height: 10),
        
            const Text(
              "Enter your email and we'll send you\n"
              "a link to reset your password.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, height: 1.5),
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
        
                if (!value.contains('@')) {
                  return 'Enter a valid email';
                }
        
                return null;
              },
            ),
        
            const SizedBox(height: 20),
        
            CustomButton(text: 'Send Reset Link', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
