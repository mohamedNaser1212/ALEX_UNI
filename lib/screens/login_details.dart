import 'package:alex_uni_app/custom_widgets/customORwidget.dart';
import 'package:alex_uni_app/screens/Loginscreen.dart';
import 'package:alex_uni_app/screens/login_form.dart';
import 'package:alex_uni_app/screens/second_login_form.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../custom_widgets/custom_social_media_icons.dart';

class LoginDetails extends StatelessWidget {
  const LoginDetails({super.key});
  static String id = 'login_details';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      height: 200,
                      width: 300,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(children: [
                  const Text(
                    'تسجيل الدخول ',
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Tajawal',
                        color: KBlueColor),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'من خلال ',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w900,
                        color: KBlueColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
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
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w900,
                                  color: KBlueColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.phone_android,
                              color:KBlueColor,
                              size: 40,
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,LoginForm.id );
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
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 40,
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: 150,
                      height: 60,
                      decoration:const  BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(190),
                          bottomRight: Radius.circular(190),
                          bottomLeft: Radius.circular(190),
                          topRight: Radius.circular(190),
                        ),
                        color: Colors.white,

                      ),
                      child: const Center(
                        child: Text('الدخول كزائر',
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.bold,
                              color: KBlueColor),
                          textAlign: TextAlign.center,
                        ),
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomORWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomSocialMediaIcons(),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
