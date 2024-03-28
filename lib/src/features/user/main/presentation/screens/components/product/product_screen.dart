import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/core/configs/api_config.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/widgets/custom_shadow_container.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/app/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.product});

  final Products? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              CustomShadowContainer(
                clipBehavior: Clip.hardEdge,
                height: 563,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                widget: Image.network(
                  "${ApiConfig.localhost}${product?.image}",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: IconButton.filledTonal(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey.shade200)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              Positioned(
                top: 50,
                right: 10,
                child: IconButton.filledTonal(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.grey.shade200)),
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outlined,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: screenLeftRightPadding,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product?.name ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Rs ${product?.price ?? ''}",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Rs ${product?.description ?? ''}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: screenLeftRightPadding,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 47,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(255, 140, 135, 135),
                        elevation: 5,
                        backgroundColor: AppColor.kMain,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusSecond),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Buy",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 47,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: const Color.fromARGB(255, 140, 135, 135),
                        elevation: 5,
                        backgroundColor: AppColor.kMain,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusSecond),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
