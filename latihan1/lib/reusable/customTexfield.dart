import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final isNumber;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;

  const Textfield({
    super.key,
    required this.hint,
    required this.controller,
    this.isPassword = false, 
    this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}