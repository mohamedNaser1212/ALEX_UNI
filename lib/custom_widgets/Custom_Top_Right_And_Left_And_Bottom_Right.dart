
import 'package:alex_uni_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTopRightAndLeftAndBottomRight extends StatelessWidget {
  const CustomTopRightAndLeftAndBottomRight({
    super.key,
    required this.text, required this.TextColor,
    required this.ContainerColor, this.icon
  });
  final String text;
  final Color TextColor ;
  final Color ContainerColor ;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(90),
          bottomRight: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        color: ContainerColor,
      ),
      child:  Center(
        child: Text(
          text,
          style:  TextStyle(
            fontSize: 26,
            fontFamily: KFontFamilyA,
            fontWeight: FontWeight.bold,
            color: TextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
