import 'package:flutter/material.dart';

void showForgotPasswordBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewInsets.bottom + 40,
        left: 30,
        right: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Text("Forgot Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
            "Enter Your Email Address",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          SizedBox(height: 25),
          // Email
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.email),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 32),
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
                'Send Code',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}

void showResetPasswordBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewInsets.bottom + 40,
        left: 30,
        right: 30,
        bottom: MediaQuery.of(context).viewInsets.bottom + 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Text("Reset Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(
            "You can reset your password here",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          SizedBox(height: 25),
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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter your Password',
              prefixIcon: const Icon(Icons.lock),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Confirm Password
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 3,
              ),
              child: const Text(
                'Confirm Password',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Confrim your Password',
              prefixIcon: const Icon(Icons.lock),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 32),
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
                'Reset Password',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
  );
}
