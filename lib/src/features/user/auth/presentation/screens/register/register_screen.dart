import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/login/login_screen.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/cubit/register_cubit.dart';
import 'package:e_needs/src/utils/custom_toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:get/get.dart';

import '../../../../../../core/app/colors.dart';
import '../otp/otp_screen.dart';

part 'widgets/register_form_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterUserCubit, RegisterUserState>(
      listener: (context, state) {
        if (state.status == RegisterUserStatus.loading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state.status == RegisterUserStatus.failure) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? ''),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
        if (state.status == RegisterUserStatus.loading) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(),
            ),
          );
          successToast(msg: "Otp sent, please check your email");
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(247, 239, 229, 1),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 45, left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Easy Shopping, ",
                      // textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Happier Shopping. ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50)),
                    color: AppColor.kMain),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
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
                          padding: const EdgeInsets.only(top: 10),
                          child: Form(
                            key: sl.get<RegisterUserCubit>().registerFormKey,
                            child: RegisterFormWidget(),
                          ),
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
                                if (sl
                                    .get<RegisterUserCubit>()
                                    .registerFormKey
                                    .currentState!
                                    .validate()) {
                                  sl.get<RegisterUserCubit>().registerUser();
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
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
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
      ),
    );
  }
}
