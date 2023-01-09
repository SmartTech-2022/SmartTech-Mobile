import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/my_text_field.dart';
import 'package:onevote/widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final vin = TextEditingController();
  final password = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kSecondarycolor,
        padding: EdgeInsets.only(
            left: 20, right: 20, top: screenHeight(context) * 0.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Back",
              style:
                  TextStyle(color: kBlackcolor, fontSize: 30, fontWeight: bold),
            ),
            Text(
              "Please enter your details to continue",
              style: TextStyle(
                color: kPrimarycolor,
                fontSize: 18,
              ),
            ),
            const Gap(50),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      controller: vin,
                      hintText: "VIN",
                    ),
                    const Gap(30),
                    MyTextField(
                      controller: password,
                      hintText: "Password",
                      isObscure: _obscureText,
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off),
                        onPressed: () {
                          togglestate();
                        },
                      ),
                    ),
                    const Gap(30),
                    MyTextButton(
                      onTap: () {
                        goToReplace(context, const HomeScreen());
                      },
                      text: "Log in",
                    ),
                    const Gap(30),
                    GestureDetector(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: kPrimarycolor, fontSize: 20),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void togglestate() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
