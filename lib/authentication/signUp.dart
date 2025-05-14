import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 3,
                    ),
                    child: const Text(
                      'Name',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your Name',
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Email
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 3,
                    ),
                    child: const Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                // Password
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 3,
                    ),
                    child: const Text(
                      'Password',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextFormField(
                  obscureText: obscure,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: const Color(0xFF3CB0FF),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
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
