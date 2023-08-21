import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.onChanged,
    this.obscureText = false,
    required this.labelText,
    this.validator,
    this.errorText,
  });

  final Function(String)? onChanged;
  final bool? obscureText;
  final String labelText;
  final String? Function(String?)? validator;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obscureText!,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          errorText: errorText,
        ),
        validator: validator,
      ),
    );
  }
}
