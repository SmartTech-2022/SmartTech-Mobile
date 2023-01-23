import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:onevote/constant/constant.dart';
import 'package:onevote/provider/auth_provider.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/utils/alerts.dart';
import 'package:onevote/utils/navigator.dart';
import 'package:onevote/utils/validator.dart';
import 'package:onevote/widgets/my_text_button.dart';
import 'package:onevote/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validator {
  final _formKey = GlobalKey<FormState>();
  final vin = TextEditingController();
  final password = TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: kSecondarycolor,
          padding: EdgeInsets.only(
              left: 20, right: 20, top: screenHeight(context) * 0.25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: kBlackcolor, fontSize: 30, fontWeight: bold),
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
                        validator: validateVin,
                        hintText: "VIN",
                      ),
                      const Gap(30),
                      MyTextField(
                        controller: password,
                        validator: validatePassword,
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
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> data = {
                              'voter_id': vin.text,
                              'password': password.text,
                            };

                            await provider.login(data).then((result) {
                              if (provider.resMessage != '') {
                                showAlertDialog(
                                    context: context,
                                    title: "Error",
                                    widget: Text(provider.resMessage));
                              } else {
                                goToReplace(context, const HomeScreen());
                              }
                            });
                          }
                        },
                        // text: "Log in",
                        child: provider.isLoading
                            ? startCircularProgress(context)
                            : const Text(
                                "Log in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0),
                              ),
                      ),
                    ],
                  )),
            ],
          ),
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
