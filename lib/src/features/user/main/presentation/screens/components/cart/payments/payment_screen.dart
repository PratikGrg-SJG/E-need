import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/cart_screen.dart';
import 'package:e_needs/src/widgets/custom_shadow_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Methods",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         CupertinoIcons.delete,
        //         color: Colors.black,
        //       )),
        // ],
      ),
      body: Padding(
        padding: screenLeftRightPadding,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomShadowContainer(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cash on Delivery",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CustomShadowContainer(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/esewa_logo.png",
                      height: 26,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
            ),
            TotalSection(isFromPaymentScreen: true),
          ],
        ),
      ),
    );
  }
}
