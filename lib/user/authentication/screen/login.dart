import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(

      //   // title: Text("logIn Screen"),
      // ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          
          // height: 100,
          // width: 180,
           decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Text("Welcome to E-Needs ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 70),
          )
          ),
      ),
        );
  }
}