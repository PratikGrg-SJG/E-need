import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/medias.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/nav_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/app/dimensions.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kSuccessImage,
              height: 250,
            ),
            SizedBox(height: 24),
            Text(
              "Order Placed Successfully",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: 255,
              height: 47,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: const Color.fromARGB(255, 140, 135, 135),
                  elevation: 5,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadiusSecond),
                  ),
                ),
                onPressed: () {
                  sl.get<NavCubit>().changeCurrentIndex(0);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                    (route) => false,
                  );
                },
                child: Text(
                  "Go to Home",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
