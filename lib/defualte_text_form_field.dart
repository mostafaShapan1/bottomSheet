import 'package:flutter/material.dart';

class DefaulteTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final bool isPassword ;

  const DefaulteTextFormField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.validator, required this.icon,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon:  Icon(icon),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xff050522),
            ),
          ),
          hintText: hintText,
          labelText: labelText,
        ),
      ),
    );
  }
}