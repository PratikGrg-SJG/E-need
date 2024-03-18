import 'package:e_needs/src/features/user/auth/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
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
                            "Create an Account",
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
                                  textInputAction: TextInputAction.next,
                                  controller: _emailController,
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
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  textInputAction: TextInputAction.next,
                                  controller: _userNameController,
                                  validator: (userName) {
                                    if (userName == null || userName.isEmpty) {
                                      return "Required field!";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "UserName",
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  textInputAction: TextInputAction.next,
                                  controller: _passwordController,
                                  obscureText: true,
                                  validator: (password) {
                                    if (password == null || password.isEmpty) {
                                      return "Required field!";
                                    }
                                    if (password.length < 8 ||
                                        password.length != 8) {
                                      return "Password needs to be atleast of 8 Characters !";
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
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  textInputAction: TextInputAction.next,
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please confirm your password!";
                                    }
                                    if (value != _passwordController.text) {
                                      return "Check your Password.";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Confirm Password",
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _phoneController,
                                  textInputAction: TextInputAction.next,
                                  validator: (phone) {
                                    if (phone == null || phone.isEmpty) {
                                      return "Please enter your contact number!";
                                    }
                                    if (phone.length < 10 ||
                                        phone.length > 10) {
                                      return "Invalid contact number!!";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    labelText: "Phone",
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: 47,
                          width: 255,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shadowColor:
                                    const Color.fromARGB(255, 140, 135, 135),
                                elevation: 5,
                                backgroundColor:
                                    Color.fromRGBO(243, 240, 245, 1)),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                storeData(_emailController.text);
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }));
                              }
                            },
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: Color.fromRGBO(18, 17, 18, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Back to Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
