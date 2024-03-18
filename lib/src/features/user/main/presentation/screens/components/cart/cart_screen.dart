import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'payments/payment_screen.dart';

part 'widgets/total_section.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
// for icon button of addong product
  int click = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.delete,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: screenLeftRightPadding,
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Card(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.black12,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 10, bottom: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/riceSack.jpg',
                                    height: 100,
                                    width: 120,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rice",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "Rs.2600",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton.filledTonal(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    AppColor.kWhite),
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.zero),
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                              Size(34, 34),
                                            ),
                                            maximumSize:
                                                MaterialStatePropertyAll(
                                              Size(34, 34),
                                            ),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(Icons.remove),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton.filledTonal(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    AppColor.kWhite),
                                            padding: MaterialStatePropertyAll(
                                                EdgeInsets.zero),
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                              Size(34, 34),
                                            ),
                                            maximumSize:
                                                MaterialStatePropertyAll(
                                              Size(34, 34),
                                            ),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TotalSection(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
