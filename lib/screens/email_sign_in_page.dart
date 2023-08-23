import 'package:alex_uni_app/custom_widgets/custom_alex_uni_logo.dart';
import 'package:alex_uni_app/reusable_widgets.dart';
import 'package:alex_uni_app/screens/forget_password.dart';
import 'package:alex_uni_app/screens/home_screen.dart';
import 'package:alex_uni_app/screens/new_password.dart';
import 'package:alex_uni_app/screens/regesteration_form.dart';
import 'package:alex_uni_app/states/login_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubit/login_cubit.dart';
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
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigateAndFinish(context: context, screen: const HomeScreen());
          }
          if (state is LoginErrorState) {

            showSnackBar(context,state.error);

          }
        },
        builder: (context,state){

          LoginCubit cubit = LoginCubit.get(context);

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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,

                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child:customAlexunilogo(),
                            ),
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
                                fontFamily: KFontFamilyT,
                                fontSize: 34,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        CustomTextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
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
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  navigateTo(context: context, screen: const ForgotPassword());
                                },
                                child: const Text('نسيت كلمة السر؟',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: KFontFamilyT,
                                    color: Color(0xff6DCFF6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context)=>GestureDetector(
                            onTap: (){
                              if(formKey.currentState!.validate()){
                                cubit.userLogin(
                                  email: email!,
                                  password: password!,
                                );
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
                                        fontFamily: KFontFamilyT,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            ),
                          ),
                          fallback: (context)=>const CircularProgressIndicator(),
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
                                  fontFamily: KFontFamilyT,
                                  color: KRegesterButtoncolor,

                                ),),
                            ),
                            const Text('ليس لديك حساب؟',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontFamily: KFontFamilyT,
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
        },
      ),
    );
  }
  void showSnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(child: Text(message)),),);

  }

}