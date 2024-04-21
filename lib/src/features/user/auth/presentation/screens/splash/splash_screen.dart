import 'package:e_needs/src/features/user/auth/presentation/screens/welcome/welcome_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/main_screen.dart';
import 'package:e_needs/src/services/local/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isNotLoggedIn = await SharedPreference.notLoggedIn();

      if (isNotLoggedIn) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/json/splash.json",
          repeat: true,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
