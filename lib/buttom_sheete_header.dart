import 'package:flutter/material.dart';

class ButtomSheetheader extends StatelessWidget {
  final String title;
  final String header;
  const ButtomSheetheader({
    super.key,
    required this.title,
    required this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              header,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cancel_outlined,
            color: Color(0xffEF5858),
            size: 30,
          ),
        ),
      ],
    );
  }
}