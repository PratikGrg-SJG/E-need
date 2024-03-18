import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/features/user/main/data/models/models.dart';
import 'package:e_needs/src/widgets/custom_shadow_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/app/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.dataModel,
  });

  final DataModel? dataModel;

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
                widget: Image.asset(
                  dataModel?.imageName ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 50,
                left: 10,
                child: IconButton.filledTonal(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.chevron_back),
                ),
              ),
              Positioned(
                top: 50,
                right: 10,
                child: IconButton.filledTonal(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  dataModel?.title ?? '',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Rs ${dataModel?.price ?? ''}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
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
                        backgroundColor: AppColor.kPurple,
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
                        backgroundColor: AppColor.kPurple,
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
