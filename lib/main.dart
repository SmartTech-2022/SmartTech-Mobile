import 'package:flutter/material.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isSeen;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
   isSeen = prefs.getInt('onBoarding');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One Vote',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: isSeen !=0 ? const SafeArea(child: OnboardingScreen()):const SafeArea(child: LoginScreen()),
    );
  }
}
