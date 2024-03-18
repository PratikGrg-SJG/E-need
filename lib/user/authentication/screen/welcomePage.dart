import 'package:e_needs/user/authentication/screen/login.dart';
import 'package:e_needs/user/authentication/screen/register.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(247, 239, 229, 1) ,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 408,
                width: 366,
                decoration: BoxDecoration(
                  boxShadow:[
                    BoxShadow(
                      color: Color.fromARGB(255, 101, 101, 98),
                      blurRadius: 5
                      
                    )
                  ],
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcomepage.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10,),
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
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
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
                      backgroundColor: Color.fromRGBO(174, 132, 199, 1),
                      maximumSize: Size(288, 47)),
                      
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Color.fromRGBO(18, 17, 18, 1),fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 47,
                width:255,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 140, 135, 135),
                    elevation: 5,
                      backgroundColor: Color.fromRGBO(174, 132, 199, 1)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));},
                  child: Text("Sign Up",
                      style: TextStyle(color: Color.fromRGBO(18, 17, 18, 1),fontWeight: FontWeight.bold,fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
