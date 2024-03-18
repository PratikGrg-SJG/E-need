import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/custom_shadow_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: screenLeftRightPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  height: 206,
                  width: 206,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    "https://wallpapers.com/images/hd/cute-aesthetic-profile-pictures-1080-x-1350-tardl07evl9032jd.jpg",
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 60,
              ),
              CustomShadowContainer(
                padding: EdgeInsets.symmetric(horizontal: 16),
                widget: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Xyzzzz@gmail.com",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.edit_outlined),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomShadowContainer(
                padding: EdgeInsets.symmetric(horizontal: 16),
                widget: TextFormField(
                  decoration: InputDecoration(
                    hintText: "User Name",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.edit_outlined),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomShadowContainer(
                padding: EdgeInsets.symmetric(horizontal: 16),
                widget: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.edit_outlined),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SizedBox(
                width: 255,
                height: 47,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 140, 135, 135),
                    elevation: 5,
                    backgroundColor: AppColor.kPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusSecond),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Save",
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
      ),
    );
  }
}
