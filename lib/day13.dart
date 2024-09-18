import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon; 

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          labelText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
      ),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

/* ----------------Controllers------=--------- */
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();

  bool _obscurePassword = true;

  // Dispose of controllers to free up resources
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose(); // Calls the super.dispose() to ensure base class cleanup
  }

/* ----------------------------------------- */

/* ------------------------------Validations------------------------------------- */
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validatePhoneNum(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    /* Phone number must start with 010, 011, 012, or 015 and be exactly 11 digits long */
    final phoneRegex = RegExp(r'^01[0-5]\d{8}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Invalid number length or number format';
    }
    return null;
  }

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    }

    // Regular expression for validating address format
    final addressRegex = RegExp(r'^\d{1,7} [a-zA-Z\s]{1,20}$');

    if (!addressRegex.hasMatch(value)) {
      return 'Address too long or invalid format';
    }

    return null;
  }
/* ------------------------------------------------------------------------ */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
      padding: const EdgeInsets.all(14.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 120),
            CustomTextField(
              hintText: 'Email',
              controller: _emailController,
              validator: _validateEmail,
              prefixIcon: Icon(Icons.email),
            ),
            CustomTextField(
              hintText: 'Password',
              controller: _passwordController,
              validator: _validatePassword,
              obscureText: true,
            ),
            CustomTextField(
              hintText: 'Confirm Password',
              controller: _confirmPasswordController,
              validator: _validateConfirmPassword,
              obscureText: _obscurePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: _obscurePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            CustomTextField(
              hintText: 'Phone Number',
              controller: _phoneNumberController,
              validator: _validatePhoneNum,
              prefixIcon: const Icon(Icons.phone),
            ),
            CustomTextField(
              hintText: 'Address',
              controller: _addressController,
              validator: _validateAddress,
              prefixIcon: const Icon(Icons.home),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Form successfully validated!')),
                  );
                }
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    ),),
    );
  }
}

