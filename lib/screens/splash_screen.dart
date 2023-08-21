import 'package:alex_uni_app/screens/Loginscreen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  // Navigates to the login page after a delay
  void _navigateToLogin() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context,   LoginScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2), // Animation duration
      curve: Curves.easeInCirc,
      decoration:const  BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
