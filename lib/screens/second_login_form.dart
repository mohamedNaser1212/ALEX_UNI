import 'package:alex_uni_app/screens/regesteration_form.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../constants.dart';
import '../custom_widgets/custom_text_form_field.dart';

class SecondLoginForm extends StatelessWidget {
   SecondLoginForm({super.key});
  static String id = 'SecondLoginForm';
   num? phone;
   String? password;
   GlobalKey<FormState> formKey = GlobalKey();
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
                textDirection: TextDirection.rtl,
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
                          height: 120,
                          child: Image.asset(
                            'assets/images/facebook 4.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  IntlPhoneField(
                      validator: (PhoneNumber? phoneNumber) {
                        if (phoneNumber == null || phoneNumber.number.isEmpty ) {
                          return 'من فضلك ادخل رقم الهاتف';
                        }else if(phoneNumber.number.length < 11){
                          return 'من فضلك ادخل رقم الهاتف بشكل صحيح';
                        }
                        return null;
                      },

                      decoration: const InputDecoration(
                        labelText: 'رقم الهاتف',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      initialCountryCode: 'EG',
                      onChanged: (PhoneNumber? phoneNumber) {
                        phone = phoneNumber!.number as num?;


                      },
                    ),
                  ),

                  const SizedBox(height: 20), // Add some space between fields
                  CustomTextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    validator: (data){
                      if(data!.isEmpty){
                        return 'الباسورد لا يمكن ان يكون فارغا';
                      }else if(data.length < 6){
                        return 'الباسورد لا يمكن ان يكون اقل من 6 احرف';
                      }
                      return null;
                    },
                      labelText: 'الباسورد'),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      children: [
                        Text(
                          'نسيت كلمة السر؟',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Tajawal',
                            color: Color(0xff6DCFF6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        print('valid');

                      }else{
                        print('not valid');
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(90),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.blue, // Use KRegesterButtoncolor here
                      ),
                      child: const Center(
                        child: Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Tajawal ',
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
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
