import 'package:crm/authentication/forgotpassword.dart';
import 'package:crm/authentication/signUp.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              // Email
              textFieldLabel(label: 'Email'),
              textField(
                hintText: 'Enter your email',
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 12),
              // Password
              textFieldLabel(label: 'Password'),
              textField(
                hintText: 'Enter password',
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      showForgotPasswordBottomSheet(context);
                    },
                    child: Text(
                      "Forgot Password...?",
                      style: TextStyle(
                        color: Color(0xFF3CB0FF),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Sign In Button
              elevatedButtons(text: 'Sign In', onPressed: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account...? ",
                      style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Color(0xFF3CB0FF)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      endIndent: 10,
                    ),
                  ),
                  const Text(
                    'or continue with',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 10,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Button
                  showAccountButton(
                    icon: Image.asset(
                      "assets/google.png",
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    text: "Google",
                  ),
                  const SizedBox(width: 30),

                  // Facebook Button
                  showAccountButton(
                    icon: Image.asset(
                      'assets/facebook.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    text: "Facebook",
                  ),
                  const SizedBox(width: 30),
                  // Twitter Button
                  showAccountButton(
                    icon: Image.asset(
                      'assets/twitter.jpg',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    text: "Twitter",
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
