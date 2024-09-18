import 'package:flutter/material.dart';
import 'package:iti_flutter_assignment/day11.dart';
import 'package:iti_flutter_assignment/day12.dart';
import 'package:iti_flutter_assignment/day13.dart';
import 'package:iti_flutter_assignment/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

