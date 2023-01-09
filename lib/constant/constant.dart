import 'package:flutter/material.dart';

var kPrimarycolor = const Color(0xff027314);
var kPrimarycolorlight = const Color(0xffC9D7CB);
var kSecondarycolor = const Color(0xffffffff);
var koffwhite = const Color(0xfff7f7f7);
var kBlackcolor = const Color(0xff000000);
var kimageplaceholder = const Color(0xffD9D9D9);
var ksurface2 = const Color(0xfff8f8f8);
var bold = FontWeight.bold;
var fnt400 = FontWeight.w400;
var fnt500 = FontWeight.w500;
var fnt600 = FontWeight.w600;
var fnt700 = FontWeight.w700;
var logo = Image.asset(
  "assets/images/logo.png",
  scale: 4,
);

//screen height
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
