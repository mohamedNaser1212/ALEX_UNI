import 'package:alex_uni_app/screens/Loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:alex_uni_app/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../custom_widgets/custom_text_form_field.dart';
import 'login_details.dart';

class RegesterationForm extends StatefulWidget {
  RegesterationForm({super.key});
  static String id = 'RegesterationForm';

  @override
  State<RegesterationForm> createState() => _RegesterationFormState();
}

class _RegesterationFormState extends State<RegesterationForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedRadioValue = 1;
  num? phone;
  bool showEmailField = true;
  String? email;
  String? password;
  bool isloading = false;
  String? name;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
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
                      Image.asset('assets/logoimage.png',
                          width: 170, height: 80),
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
                          fontFamily: 'Tajawal',
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
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'الاسم لا يمكن ان يكون فارغا';
                        }
                      },
                      labelText: 'الاسم',
                    ),
                  ),
                  if (selectedRadioValue == 1)
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
                  if (selectedRadioValue == 2)
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
                        groupValue: selectedRadioValue,
                        onChanged: (value) {
                          setState(() {
                            selectedRadioValue = value as int;
                            showEmailField = true;
                          });
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
                        groupValue: selectedRadioValue,
                        onChanged: (value) {
                          setState(() {
                            selectedRadioValue = value as int;
                            showEmailField = false;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (showEmailField)
                    CustomTextFormField(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return 'البريد الالكتروني لا يمكن أن يكون فارغاً';
                        } else if (!data.contains('@')) {
                          return 'من فضلك أدخل بريد إلكتروني صحيح';
                        }
                      },
                      labelText: 'البريد الالكتروني',
                    ),
                  if (!showEmailField)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IntlPhoneField(
                        validator: (PhoneNumber? phoneNumber) {
                          if (phoneNumber == null || phoneNumber.number.isEmpty) {
                            return 'من فضلك ادخل رقم الهاتف';
                          } else if (phoneNumber.number.length < 11) {
                            return 'من فضلك ادخل رقم الهاتف بشكل صحيح';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'رقم الهاتف',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            borderSide: BorderSide(
                              color: Colors.white, // White border color
                            ),
                          ),
                        ),
                        initialCountryCode: 'EG',
                        onChanged: (PhoneNumber? phoneNumber) {
                          phone = phoneNumber!.number as num?;
                        },
                      ),
                    ),
                  CustomTextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                     password = value;
                      return null;
                    }, labelText: 'الباسورد',
                  ),

                  CustomTextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Confirm Password is required';
                      }
                      if (value != password) {
                        return 'Passwords do not match';
                      }
                     confirmPassword = value;
                      return null;
                    }, labelText: 'تأكيد الباسورد',
                  ),

                  InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, LoginDetails.id);
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
                        child: const Center(
                          child: Text(
                            'انشاء حساب',
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
  }
}
