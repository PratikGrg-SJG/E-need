import 'package:e_needs/src/features/user/main/presentation/screens/components/home/home_screen.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  storeData(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("USER", user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 239, 229, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Easy Shopping, ",
                    // textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Happier Shopping. ",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 1000,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                  color: Color.fromRGBO(119, 67, 219, 1)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Welcome Back",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              // email form

                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: _emailController,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This is required filed";
                                  }
                                  if (!value.contains("@")) {
                                    // if value ma @ chaina vane
                                    return "please enter a valied emails";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),

                              // password form

                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.white),
                                textInputAction: TextInputAction.done,
                                controller: _passwordController,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "This is required filed";
                                  }
                                  if (value.length < 8) {
                                    // if value ma 8 ,character chaina vane
                                    return "password must be of eight characters";
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      // login button
                      SizedBox(
                        height: 47,
                        width: 288,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              storeData(_emailController.text);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return HomeScreen();
                              }));
                            }
                          },
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(247, 239, 229, 1),
                              textStyle: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              elevation: 20,
                              shadowColor:
                                  const Color.fromARGB(255, 94, 89, 89),
                              // side: BorderSide(color: )
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),

                      // register account
                      SizedBox(
                        height: 10,
                      ),

                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          }));
                        },
                        title: Center(
                          child: Text(
                            "Dont have an account ? Sign Up!",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // Text("Or",
                      // style: TextStyle(color: Colors.white),),
                      // // Login as admin
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.of(context)
                      //         .push(MaterialPageRoute(builder: (context) {
                      //       return AdminScreen();
                      //     }));
                      //   },
                      // title: Center(
                      //   child: Text(
                      //     "Are you Admin ? click here!",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      //),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
