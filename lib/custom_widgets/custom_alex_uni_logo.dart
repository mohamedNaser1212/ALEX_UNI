import 'package:flutter/material.dart';

class customAlexunilogo extends StatelessWidget {
  const customAlexunilogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
      ),
      width: 250,
      height: 120,
      child: Image.asset(
        'assets/images/facebook 4.png',
      ),
    );
  }
}
