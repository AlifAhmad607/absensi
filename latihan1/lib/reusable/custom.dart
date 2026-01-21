import 'package:flutter/material.dart';

class custom extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscure;
  final Color mytextcolor;

  const custom({
    super.key,
    required this.label,
    required this.controller,
    this.obscure = false,
    required this.mytextcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        style: TextStyle(color: mytextcolor),
      ),
    );
      
  }
}