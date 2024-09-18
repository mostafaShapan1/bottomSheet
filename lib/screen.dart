import 'package:flutter/material.dart';
import 'package:iti_flutter_assignment/buttom_sheete_header.dart';
import 'package:iti_flutter_assignment/defualte_text_form_field.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final TextEditingController _courseController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff050522),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/welcome_image.png",
                  width: 394,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                    color: Color(0xffEF5858),
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit, sed\n do eiusmod",
                  style: TextStyle(
                    color: Color(0xffF4F4F4),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 281,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFFDE69),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: const Color(0xffFFECAA),
                        context: context,
                        
                        builder: (context) {
                          return SingleChildScrollView(
                            child: SizedBox(
                              width: double.infinity,
                              // height: 500,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 30,
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ButtomSheetheader(
                                        title: "hello...",
                                        header: "Register",
                                      ),
                                      DefaulteTextFormField(
                                        hintText: "Enter your name / email",
                                        labelText: "username / email",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          } else if (!emailRegex
                                              .hasMatch(value)) {
                                            return 'Invalid email format';
                                          }
                                          return null;
                                        },
                                        controller: _emailController,
                                        icon: Icons.email_outlined,
                                      ),
                                      DefaulteTextFormField(
                                        hintText: "course",
                                        labelText: "course",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        controller: _courseController,
                                        icon: Icons.text_fields,
                                      ),
                                      DefaulteTextFormField(
                                        hintText: "password",
                                        labelText: "password",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                        controller: _passwordController,
                                        icon: Icons.visibility_outlined,
                                        isPassword: true,
                                      ),
                                      DefaulteTextFormField(
                                        hintText: "confirm password",
                                        labelText: "confirm password",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          } else if (_confirmPasswordController !=
                                              _passwordController) {
                                            return 'password do not match';
                                          }
                                          return null;
                                        },
                                        controller: _confirmPasswordController,
                                        icon: Icons.visibility_outlined,
                                        isPassword: true,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: 60,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff050522),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                color: Color(0xffFFDE69),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Already have account? "),
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Login",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff1B1A40),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 281,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff050522),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(
                        width: 3,
                        color: Color(0xffFFDE69),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: false,
                        backgroundColor: const Color(0xffFFECAA),
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            width: double.infinity,
                            // height: 500,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 30,
                              ),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const ButtomSheetheader(
                                      title: "Welocome back...",
                                      header: "Login",
                                    ),
                                    DefaulteTextFormField(
                                      hintText: "Enter your name / email",
                                      labelText: "username / email",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        } else if (!emailRegex
                                            .hasMatch(value)) {
                                          return 'Invalid email format';
                                        }
                                        return null;
                                      },
                                      controller: _emailController,
                                      icon: Icons.email_outlined,
                                    ),
                                    DefaulteTextFormField(
                                      hintText: "password",
                                      labelText: "password",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      controller: _passwordController,
                                      icon: Icons.visibility_outlined,
                                      isPassword: true,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: false,
                                                onChanged: (value) {}),
                                            const Text("Remember me"),
                                          ],
                                        ),
                                        const Text("Forgot Password?")
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 60,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff050522),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Color(0xffFFDE69),
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Don’t have an account? "),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Register",
                                            style:
                                                TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffFFDE69),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  "All Right Reserved @2021",
                  style: TextStyle(
                    color: Color(0xffFFDE69),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
