import 'package:alex_uni_app/screens/Loginscreen.dart';
import 'package:alex_uni_app/screens/login_details.dart';
import 'package:alex_uni_app/screens/login_form.dart';
import 'package:alex_uni_app/screens/regesteration_form.dart';
import 'package:alex_uni_app/screens/second_login_form.dart';
import 'package:alex_uni_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        LoginDetails.id: (context) => const LoginDetails(),
        LoginForm.id: (context) =>  LoginForm(),
        SecondLoginForm.id: (context) =>  SecondLoginForm(),
        RegesterationForm.id: (context) =>  RegesterationForm(),

      },
      initialRoute: SplashScreen.id,
      locale: const Locale('ar', 'AR'),
    );
  }
}
