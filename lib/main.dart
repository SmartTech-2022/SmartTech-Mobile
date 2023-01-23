import 'package:flutter/material.dart';
import 'package:onevote/provider/auth_provider.dart';
import 'package:onevote/provider/candidate_list_provider.dart';
import 'package:onevote/screens/home_screen.dart';
import 'package:onevote/screens/login_screen.dart';
import 'package:onevote/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isSeen;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isSeen = prefs.getInt('onBoarding');

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => CandidateListProvider()),
    ],
    child: const MyApp(),
  ));
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
      home: const CheckAuth(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString('token');
    if (authToken != null) {
      setState(() => isAuth = true);
    }
  }

  @override
  void initState() {
    _isLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isAuth) {
      return const HomeScreen();
    } else {
      return isSeen != 1
          ? const SafeArea(child: OnboardingScreen())
          : const SafeArea(child: LoginScreen());
    }
  }
}
