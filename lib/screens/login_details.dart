import 'package:flutter/material.dart';
import 'package:alex_uni_app/custom_widgets/customORwidget.dart';
import 'package:alex_uni_app/screens/phone_sign_in_page.dart';
import 'package:alex_uni_app/screens/email_sign_in_page.dart';
import '../constants.dart';
import '../custom_widgets/custom_social_media_icons.dart';

class LoginDetails extends StatelessWidget {
  static  String id = 'login_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/whitebackground.png'), // Replace with your background image path
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
                      Image.asset('assets/images/facebook 4.png'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const Text(
                        'تسجيل الدخول ',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          fontFamily: KFontFamilyT,
                          color: KBlueColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'من خلال ',
                        style: TextStyle(
                          fontSize: 26,
                          fontFamily: KFontFamilyT,
                          fontWeight: FontWeight.w900,
                          color: KBlueColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, SecondLoginForm.id);
                        },
                        child: Container(
                          width: 270,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(90),
                              bottomRight: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: KRegesterButtoncolor,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'رقم الهاتف',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: KFontFamilyT,
                                  fontWeight: FontWeight.w900,
                                  color: KBlueColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.phone_android,
                                color: KBlueColor,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginForm.id);
                        },
                        child: Container(
                          width: 270,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(90),
                              bottomLeft: Radius.circular(50),
                            ),
                            color: KLOGINBUTTONCOLOR,
                          ),
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'البريد الالكتروني ',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: KFontFamilyT,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
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
                              fontSize: 24,
                              fontFamily: KFontFamilyT,
                              fontWeight: FontWeight.bold,
                              color: KBlueColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const CustomORWidget(),
                      const SizedBox(height: 20),
                      const CustomSocialMediaIcons(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
