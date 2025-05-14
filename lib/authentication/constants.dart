import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget textFieldLabel({required String label}) {
  return Align(
    alignment: Alignment.topLeft,
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 3,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget textField(
    {required String hintText,
    required IconData prefixIcon,
    IconButton? suffixIcon}) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

Widget elevatedButtons({
  required String text,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: const Color(0xFF3CB0FF),
        foregroundColor: Colors.white,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    ),
  );
}

Widget showAccountButton({required IconData icon, required String text}) {
  return Column(
    children: [
      IconButton(
        onPressed: () {},
        icon: FaIcon(
          icon,
          color: Colors.black,
          size: 30,
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
