import 'package:flutter/material.dart';

import '../constants.dart';

class CustomORWidget extends StatelessWidget {
  const CustomORWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 1,
          color: KBlueColor,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text('او',
          style: TextStyle(
              fontSize: 26,
              fontFamily: 'Bebas Neue',
              fontWeight: FontWeight.bold,
              color: KBlueColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 100,
          height: 1,
          color: KBlueColor,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
