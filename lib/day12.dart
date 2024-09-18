import 'package:flutter/material.dart';

class Day12 extends StatefulWidget {
  const Day12({super.key});

  @override
  State<Day12> createState() => _Day12State();
}

class _Day12State extends State<Day12> {
  double age = 21;
  bool gender = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: ClipOval(
                  child: Image.network(
                      "https://media.gettyimages.com/id/601823049/photo/portrait-of-young-man-with-curly-blond-hair-wearing-white-t-shirt.jpg?s=612x612&w=0&k=20&c=dl4QItelOMfISa03Mc9iHEsJXmx1B1SeWTR46D5e1Gs="),
                ),
              ),
              const Text("name : Ahmed Hemdan"),
              Text("age : ${age.toInt()}"),
              const Text("city : cairo"),
              gender
                  ? const Text("Gender : male")
                  : const Text("Gender : female"),
              Slider(
                  max: 100,
                  min: 0,
                  value: age,
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  }),
              Row(
                
                children: [
                  Checkbox(
                      value: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                  const Text("male"),
                  Checkbox(
                      value: !gender,
                      onChanged: (value) {
                        setState(() {
                          gender = !value!;
                        });
                      }),
                  const Text("female"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
