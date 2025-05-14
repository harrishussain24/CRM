import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                // Name
                textFieldLabel(label: 'Name'),
                textField(
                    hintText: 'Enter your Name', prefixIcon: Icons.person),
                const SizedBox(height: 12),
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
                    icon:
                        Icon(obscure ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                const SizedBox(height: 24),

                // Create Account Button
                elevatedButtons(text: 'Sign Up', onPressed: () {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? ",
                        style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(color: Color(0xFF3CB0FF)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
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
                      'or',
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

                // Google Button
                SocialButton(
                  icon: FontAwesomeIcons.google,
                  text: 'Continue with Google',
                ),
                const SizedBox(height: 16),

                // Twitter Button
                SocialButton(
                  icon: FontAwesomeIcons.xTwitter,
                  text: 'Continue with Twitter',
                ),
                const SizedBox(height: 16),

                // Facebook Button
                SocialButton(
                  icon: FontAwesomeIcons.facebook,
                  text: 'Continue with Facebook',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: FaIcon(icon, color: Colors.black),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
