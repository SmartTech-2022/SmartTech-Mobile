import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool? isObscure;
  final IconData? icon;
  final Widget? suffixIcon;

  const MyTextField(
      {this.controller,
      this.validator,
      this.hintText,
      this.isObscure = false,
      this.icon,
      this.suffixIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIconColor: kPrimarycolor,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 40.0, 15.0),
          iconColor: kPrimarycolor,
          hintText: hintText,
          hintStyle: TextStyle(color: kPrimarycolor),
          fillColor: const Color.fromARGB(255, 254, 251, 251),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: kPrimarycolor),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: kPrimarycolor))),
    );
  }
}
