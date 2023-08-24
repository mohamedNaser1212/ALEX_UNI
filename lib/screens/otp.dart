import 'package:alex_uni_app/constants.dart';
import 'package:alex_uni_app/screens/Loginscreen.dart';
import 'package:alex_uni_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Otp extends StatelessWidget {
   Otp({Key? key, required this.verificationId}) : super(key: key);
  static String id = 'otp';
final GlobalKey<ScaffoldState>scaffoldKey= GlobalKey<ScaffoldState>();
final String verificationId;
  @override
  Widget build(BuildContext context) {
    TextEditingController optController=TextEditingController();

  verifyOtp()async{
  PhoneAuthCredential credential= PhoneAuthProvider.credential(
    verificationId: verificationId
  , smsCode: optController.text);
  await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
    if(value.user!=null){
      Navigator.pushNamed(context, HomeScreen.id);
    }
  });

  }
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.white),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.white),
      ),
    );
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              Image.asset('assets/images/facebook 4.png'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 80,
                child: Text(
                  'تأكيد رقم الموبايل ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: KFontFamilyT,
                    fontSize: 34,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
             
               TextField(
                controller: optController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide:
                   BorderSide(color: Colors.white))
                ),

               ),
               SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  verifyOtp();
                  print(verificationId);
                  print('done');
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
                      'تأكيد',
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
    );
  }
}
