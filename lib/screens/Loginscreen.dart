import 'package:flutter/material.dart';
import 'package:alex_uni_app/constants.dart';
import 'package:alex_uni_app/screens/login_details.dart';
import 'package:alex_uni_app/screens/regesteration_form.dart';

import '../custom_widgets/customORwidget.dart';
import '../custom_widgets/custom_social_media_icons.dart';

class LoginScreen extends StatelessWidget {
  static  String id = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set the background image using BoxDecoration
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/whitebackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/facebook 4.png'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Text(
                        'WELCOME TO ',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Bebas Neue',
                          color: KBlueColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'ALEXANDRIA UNIVERSITY APP. ',
                        style: TextStyle(
                          fontSize: 34,
                          fontFamily: 'Bebas Neue',
                          fontWeight: FontWeight.w300,
                          color: KBlueColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginDetails.id);
                        },
                        child: Container(
                          width: 200,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(90),
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: KLOGINBUTTONCOLOR,
                          ),
                          child: const Center(
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Bebas Neue',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegesterationForm.id);
                        },
                        child: Container(
                          width: 200,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(90),
                              bottomLeft: Radius.circular(50),
                            ),
                            color: KRegesterButtoncolor,
                          ),
                          child: const Center(
                            child: Text(
                              'انشاء حساب',
                              style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'Bebas Neue',
                                fontWeight: FontWeight.bold,
                                color: KBlueColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(190),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            'الدخول كزائر',
                            style: TextStyle(
                              fontSize: 26,
                              fontFamily: 'Bebas Neue',
                              fontWeight: FontWeight.bold,
                              color: KBlueColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CustomORWidget(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CustomSocialMediaIcons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
