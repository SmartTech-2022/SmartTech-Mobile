import 'package:flutter/material.dart';
import 'package:onevote/constant/constant.dart';

class MyContainer extends StatelessWidget {
  const MyContainer(
      {this.text,
      this.width = double.infinity,
      this.height,
      this.child,
      this.color, //background color
      this.fgcolor, //foreground color
      this.borderSide,
      this.textStyle,
      this.alignment,
      this.padding,
      super.key,
      this.bgcolor});
  final String? text;
  final double? width;
  final double? height;
  final Widget? child;
  final Color? color;
  final Color? bgcolor;
  final Color? fgcolor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final Alignment? alignment;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height ?? 50.0,
      alignment: alignment,
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.2,
            color: kPrimarycolor,
          ),
          borderRadius: BorderRadius.circular(5.0),
          color: koffwhite),
      child: child ?? Text(text!),
    );
  }
}
