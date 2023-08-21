import 'package:alex_uni_app/screens/Loginscreen.dart';
import 'package:alex_uni_app/screens/home_screen.dart';
import 'package:alex_uni_app/screens/login_details.dart';
import 'package:alex_uni_app/screens/login_form.dart';
import 'package:alex_uni_app/screens/regesteration_form.dart';
import 'package:alex_uni_app/screens/second_login_form.dart';
import 'package:alex_uni_app/screens/splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cache_helper.dart';
import 'cubit/bloc_observer.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        HomeScreen.id: (context) =>  HomeScreen(),
      },
      initialRoute: SplashScreen.id,
      locale: const Locale('ar', 'AR'),
    );
  }
}
