import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/login/login_screen.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/register_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 239, 229, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: Column(
            children: [
              Container(
                height: 408,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 101, 101, 98), blurRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcomepage.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome to E-Needs",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Place where needs are served... ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 255,
                height: 47,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: const Color.fromARGB(255, 140, 135, 135),
                      elevation: 5,
                      backgroundColor: AppColor.kMain,
                      maximumSize: Size(288, 47)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 47,
                width: 255,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 140, 135, 135),
                    elevation: 5,
                    backgroundColor: AppColor.kMain,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => RegisterScreen()));
                  },
                  child: Text("Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
