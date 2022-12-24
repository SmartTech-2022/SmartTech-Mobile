import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton(
      {required this.onTap,
       this.text,
      this.width = double.infinity,
      this.height,
      this.child,
      this.color,
      this.bgcolor,//background color
      this.fgcolor,//foreground color
      this.textStyle,
      this.borderSide,
      super.key});
  final VoidCallback onTap;
  final String? text;
  final double? width;
  final double? height;
  final Widget? child;
  final Color? color;
  final Color? bgcolor;
  final Color? fgcolor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor ??const Color(0xff027314),
          foregroundColor:fgcolor?? const Color(0xffffffff),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),side: borderSide ??BorderSide.none),
        ),
        child: child ??
              Text(text!,
                  style: textStyle ??
                      const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600)),
      ),
    );
  }
}
