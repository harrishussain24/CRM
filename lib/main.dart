import 'package:crm/authentication/signIn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0xFF3CB0FF),
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
      ),
      home: const SignInScreen(),
    );
  }
}
