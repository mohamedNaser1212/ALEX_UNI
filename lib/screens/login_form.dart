import 'package:alex_uni_app/screens/regesteration_form.dart';
import 'package:alex_uni_app/screens/second_login_form.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../custom_widgets/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
   LoginForm({super.key});
  static String id = 'LoginForm';
  String? email;
   String? password;

   bool isloading = false;

   GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity, // Cover the whole screen vertically
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff3499EF),
              Color(0xff123A5B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/logoimage.png', width: 170, height: 80),
                    ],
                  ),
                  const  SizedBox(height: 100),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal',
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  CustomTextFormField(
                    validator: (data){
                      if(data!.isEmpty){
                        return 'البريد الالكتروني لا يمكن ان يكون فارغا';
                      }else if(!data.contains('@')){
                        return 'البريد الالكتروني غير صحيح';
                      }
                      return null;
                    },
                    labelText: 'البريد الالكتروني',
                  onChanged: (data){
                      email = data;
                  },
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (data){
                      if(data!.isEmpty){
                        return 'الباسورد لا يمكن ان يكون فارغا';
                      }else if(data.length < 6){
                        return 'الباسورد لا يمكن ان يكون اقل من 6 احرف';
                      }
                      return null;
                    },
                    labelText: 'الباسورد',
                    onChanged: (data){
                      password = data;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                    child: Row(
                      children: [
                        Text('نسيت كلمة السر؟',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal',
                            color: Color(0xff6DCFF6),

                          ),),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 30,

                  ),
                  GestureDetector(
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        print('Valid');

                      }else{
                        print('Not Valid');
                      }
      },


                    child: Container(
                        width: 200,
                        height: 60,
                        decoration:const  BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            bottomRight: Radius.circular(50),

                          ),
                          color: KRegesterButtoncolor,

                        ),
                        child: const Center(
                          child: Text('تسجيل الدخول',
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Tajawal ',
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, RegesterationForm.id);
                        },
                        child: const Text('انشاء حساب',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal',
                            color: KRegesterButtoncolor,

                          ),),
                      ),
                      const Text('ليس لديك حساب؟',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal',
                          color: Colors.white,

                        ),),

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
