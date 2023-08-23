import 'package:alex_uni_app/constants.dart';
import 'package:alex_uni_app/custom_widgets/custom_alex_uni_logo.dart';
import 'package:alex_uni_app/screens/email_sign_in_page.dart';
import 'package:alex_uni_app/screens/new_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static String id = 'ForgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // String? email;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailTextFormController = TextEditingController();

  String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "Please enter an email";
    } else if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  Future verifyEmail() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextFormController.text.trim());
  AlertDialog alert = AlertDialog(
    title: const Text("تم ارسال رابط"),
    content: const Text("تم ارسال رابط الي البريد الالكتروني"),
    actions: [
      TextButton(
        child: const Text("موافق"),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginForm()));
        },
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
      );
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error sending reset link. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future loginFunc() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  TextFormHint? _textFormHint;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity, // Cover the whole screen vertically
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: customAlexunilogo(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 100),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "هل نسيت كلمة السر؟",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: KFontFamilyT,
                            fontSize: 34,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 42,
                        ),
                        Text(
                          "سيتم ارسال الرمز من خلال",
                          style: TextStyle(
                            fontFamily: KFontFamilyT,
                            fontSize: 21,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
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
                          value: TextFormHint.email,
                          groupValue: _textFormHint,
                          onChanged: (value) {
                            setState(() {
                              _textFormHint = value;
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
                        Radio<TextFormHint>(
                          value: TextFormHint.phone,
                          groupValue: _textFormHint,
                          onChanged: (value) {
                            setState(() {
                              _textFormHint = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (_textFormHint == TextFormHint.email)
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: TextFormField(
                          controller: emailTextFormController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            labelText: "البريد الالكتروني",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            return emailValidator(value!);
                          },
                          onFieldSubmitted: (value) {
                            loginFunc();
                          },
                        ),
                      ),
                    if (_textFormHint == TextFormHint.phone)
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintTextDirection: TextDirection.rtl,
                            labelText: "رقم الهاتف",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),

                        ),
                      ),
                    const SizedBox(
                      height: 75,
                    ),
                    GestureDetector(
                      onTap: () {
                        verifyEmail();
                      },
                      child: Container(
                        width: 200,
                        height: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            bottomRight: Radius.circular(50),
                          ),
                          color: KRegesterButtoncolor,
                        ),
                        child: const Center(
                          child: Text(
                            "متابعة",
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum TextFormHint { email, phone }