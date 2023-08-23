import 'package:alex_uni_app/cubit/login_cubit.dart';
import 'package:alex_uni_app/states/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class CustomSocialMediaIcons extends StatelessWidget {
  const CustomSocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          return Column(
            children: [
              const Text('تسجيل الدخول بوسائل التواصل الاجتماعي',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    fontFamily: KFontFamilyT,
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
                        'assets/images/Facebookicon.png',
                        width: 30, // Adjust the image width as needed
                        height: 30, // Adjust the image height as needed
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    onTap: () {
                      LoginCubit.get(context).googleLogin(context);
                    },
                    child: Container(
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
                          'assets/images/google.png',
                          width: 30, // Adjust the image width as needed
                          height: 30, // Adjust the image height as needed
                        ),
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
                        'assets/images/twitter.png',
                        width: 30, // Adjust the image width as needed
                        height: 30, // Adjust the image height as needed
                      ),
                    ),
                  ),

                ],
              )
            ],
          );
        },
      ),
    );
  }
}
