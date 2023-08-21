import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSocialMediaIcons extends StatelessWidget {
  const CustomSocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('تسجيل الدخول بوسائل التواصل الاجتماعي',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
              color: KBlueColor),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Colors.white54,
              ),
              child: Center(
                child: Image.asset(
                  'assets/Facebookicon.png',
                  width: 30, // Adjust the image width as needed
                  height: 30, // Adjust the image height as needed
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Colors.white54,
              ),
              child: Center(
                child: Image.asset(
                  'assets/google.png',
                  width: 30, // Adjust the image width as needed
                  height: 30, // Adjust the image height as needed
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                color: Colors.white54,
              ),
              child: Center(
                child: Image.asset(
                  'assets/twitter.png',
                  width: 30, // Adjust the image width as needed
                  height: 30, // Adjust the image height as needed
                ),
              ),
            ),

          ],
        )
      ],
    );
  }
}
