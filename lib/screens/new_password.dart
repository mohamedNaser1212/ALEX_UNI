import 'package:alex_uni_app/constants.dart';
import 'package:alex_uni_app/custom_widgets/custom_alex_uni_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});
  static  String id = 'NewPassword';

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailTextFormController = TextEditingController();

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
      ),
    );
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "قم بإدخال كلمة السر";
    } else if (value.length < 8) {
      return "كلمة السر يجب ألا تكون اقل من ٨ حروف";
    }
    return null;
  }

  String? confirmPassValidator(String? value) {
    if (value!.isEmpty) {
      return "قم بإدخال كلمة السر";
    } else if (value.length < 8) {
      return "كلمة السر يجب ألا تكون اقل من ٨ حروف";
    } else if (value != pass.text) {
      return 'كلمة السر غير متطابقه';
    }
    return null;
  }

  Future loginFunc() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {

    }
  }

  int selectedRadioValue = 1;
  void changeRadioValue(int value) {
    selectedRadioValue = value;
    // --- emit ---
  }

  bool showEmailField = true;
  void changeEmailFieldState(bool value) {
    showEmailField = value;
    // --- emit ---
  }

  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  bool passVisibility = true;
  bool passVisibility2 = true;



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
                            child:customAlexunilogo(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                      const Text(
                        "انشاء كلمة مرور جديدة",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: KFontFamilyT,
                          fontSize: 34,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              controller: pass,
                              obscureText: passVisibility,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passVisibility = !passVisibility;
                                    });
                                  },
                                  icon: Icon(
                                    passVisibility
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                hintTextDirection: TextDirection.rtl,
                                labelText: "كلمة المرور",
                                labelStyle: const TextStyle(color: Colors.white),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),

                              validator: (value) {
                                return passwordValidator(value!);
                              },
                              onFieldSubmitted: (value) {
                                loginFunc();
                              },
                            ),
                            const SizedBox(
                              height: 35,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              obscureText: passVisibility2,
                              controller: confirmPass,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passVisibility2 = !passVisibility2;
                                    });
                                  },
                                  icon: Icon(
                                    passVisibility2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                hintTextDirection: TextDirection.rtl,
                                labelText: "تأكيد كلمة المرور",
                                labelStyle: const TextStyle(color: Colors.white),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                return confirmPassValidator(value!);
                              },
                              onFieldSubmitted: (value) {
                                loginFunc();
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 75,
                      ),
                      GestureDetector(
                        onTap: () {
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
                              "اعادة تعيين",
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
