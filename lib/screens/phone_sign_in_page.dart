import 'package:alex_uni_app/custom_widgets/Intle_phone_widget.dart';
import 'package:alex_uni_app/custom_widgets/custom_alex_uni_logo.dart';
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:customAlexunilogo(),
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
                          fontFamily: KFontFamilyT,
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Intelphonewidget()
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
                            fontFamily: KFontFamilyT,
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

                      }else{
                        print('not valid');
                      }
                    },
                    child: InkWell(
                      onTap: (){

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
                              fontFamily: KFontFamilyT,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
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
                            fontFamily: KFontFamilyT,
                            color: KRegesterButtoncolor,

                          ),),
                      ),
                      const SizedBox(width: 5,),
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
  }
}
