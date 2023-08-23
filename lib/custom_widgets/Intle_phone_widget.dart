
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class Intelphonewidget extends StatelessWidget {
  Intelphonewidget({super.key});
  PhoneNumber? phone;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(

      validator: (PhoneNumber? phoneNumber) {
        if (phoneNumber == null || phoneNumber.number.isEmpty) {
          return 'من فضلك ادخل رقم الهاتف';
        } else if (phoneNumber.number.length < 11) {
          return 'من فضلك ادخل رقم الهاتف بشكل صحيح';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'رقم الهاتف',
        labelStyle: TextStyle(
          color: Colors.white,

        ),
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
        phone = phoneNumber  ;
        print(phone!.completeNumber);
      },
    );
  }
}