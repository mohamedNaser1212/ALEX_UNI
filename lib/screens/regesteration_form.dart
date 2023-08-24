import 'package:alex_uni_app/cubit/register_cubit.dart';
import 'package:alex_uni_app/custom_widgets/Intle_phone_widget.dart';
import 'package:alex_uni_app/screens/email_sign_in_page.dart';
import 'package:alex_uni_app/states/register_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:alex_uni_app/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../custom_widgets/custom_text_form_field.dart';
import 'login_details.dart';


class RegesterationForm extends StatelessWidget {
  RegesterationForm({super.key});

  static String id = 'RegesterationForm';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  num? phone;
  String? email;
  String? password;
  bool isloading = false;
  String? name;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if(state is CreateUserSuccessState){
            Navigator.pushReplacementNamed(context, LoginForm.id);
          }
          if(state is RegisterErrorState){
            showSnackBar(context,state.error);
          }
        },
        builder: (context,state){
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.white,
                                  ),
                                  width: 250,
                                  height: 110,
                                  child: Image.asset(
                                    'assets/images/facebook 4.png',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                           const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'انشاء حساب',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: KFontFamilyT,
                                  fontSize: 34,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextFormField(
                              keyboardType: TextInputType.name,
                              onChanged: (value) {
                                name = value;
                              },
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'الاسم لا يمكن ان يكون فارغا';
                                }
                                return null;
                              },
                              labelText: 'الاسم',
                            ),
                          ),
                          if (cubit.selectedRadioValue == 1)
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'سيكون البريد الالكتروني هو الوضع الافتراضي',
                                style: TextStyle(
                                  color: KRegesterButtoncolor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: KFontFamilyT,
                                ),
                              ),
                            ),
                          if (cubit.selectedRadioValue == 2)
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'سيكون رقم  الهاتف هو الوضع الافتراض',
                                style: TextStyle(
                                  color: KRegesterButtoncolor,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: KFontFamilyT,
                                ),
                              ),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'البريد الالكتروني',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: KFontFamilyT,
                                ),
                              ),
                              Radio(
                                value: 1,
                                groupValue: cubit.selectedRadioValue,
                                onChanged: (value) {
                                  cubit.changeRadioValue(value as int);
                                  cubit.changeEmailFieldState(true);
                                },
                              ),
                              const Text(
                                'رقم الهاتف',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  fontFamily: KFontFamilyT,
                                ),
                              ),
                              Radio(
                                value: 2,
                                groupValue: cubit.selectedRadioValue,
                                onChanged: (value) {
                                  cubit.changeRadioValue(value as int);
                                  cubit.changeEmailFieldState(false);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          if (cubit.showEmailField)
                            CustomTextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (data) {
                                if (data!.isEmpty) {
                                  return 'البريد الالكتروني لا يمكن أن يكون فارغاً';
                                } else if (!data.contains('@')) {
                                  return 'من فضلك أدخل بريد إلكتروني صحيح';
                                }
                                return null;
                              },
                              labelText: 'البريد الالكتروني',
                            ),
                          if (!cubit.showEmailField)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Intelphonewidget(),
                            ),
                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'الباسورد مطلوب';
                              }
                              if (value.length < 8) {
                                return 'كلمه السر يجب الا تقل عن 8 احرف ';
                              }
                              password = value;
                              return null;
                            }, labelText: 'الباسورد',
                          ),

                          CustomTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            onChanged: (value) {
                              confirmPassword = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'تأكيد الباسورد مطلوب';
                              }
                              if (value != password) {
                                return 'كلمات السر غير متطابقه';
                              }
                              confirmPassword = value;
                              return null;
                            }, labelText: 'تأكيد الباسورد',
                          ),

                          ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context)=>InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userRegister(
                                      name: name!,
                                      email: email!,
                                      password: password!,
                                    );
                                  }
                                },
                                child:Container(
                                  width: 200,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      bottomLeft: Radius.circular(50),
                                    ),
                                    color: KRegesterButtoncolor,
                                  ),
                                  child:  const Center(
                                    child: Text(
                                      'انشاء حساب',
                                      style: TextStyle(
                                        fontSize: 26,
                                        fontFamily: KFontFamilyA,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              fallback: (context)=>const CircularProgressIndicator(),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, LoginDetails.id);
                                },
                                child: const Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: KFontFamilyT,
                                    color: KRegesterButtoncolor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5,),

                              const Text(
                                'لديك حساب بالفعل ؟',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: KFontFamilyT,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),


                        ]
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
      content: Text(message),),);

  }
}


