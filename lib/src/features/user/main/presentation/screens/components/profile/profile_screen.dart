import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/get_user_cubit/get_user_details_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/update_profile_cubit/update_profile_cubit.dart';
import 'package:e_needs/src/services/network/api_handler.dart';
import 'package:e_needs/src/utils/custom_toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../widgets/custom_shadow_container.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state.status == UpdateProfileStatus.loading) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        }
        if (state.status == UpdateProfileStatus.failure) {
          Navigator.pop(context);
          errorToast(msg: state.message);
        }
        if (state.status == UpdateProfileStatus.success) {
          sl.get<GetUserDetailsCubit>().getUserDetails();
          Navigator.pop(context);
          successToast(msg: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              padding: screenLeftRightPadding,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Text(
                      "Are you sure you want to logout?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          sl.get<ApiHandler>().logout(context: context);
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: Padding(
          padding: screenLeftRightPadding,
          child: SingleChildScrollView(
            child: BlocBuilder<GetUserDetailsCubit, GetUserDetailsState>(
              builder: (context, state) {
                return Form(
                  key: sl.get<UpdateProfileCubit>().updateProfileFormKey,
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
                          controller:
                              sl.get<UpdateProfileCubit>().emailController,
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
                            hintText: "Email",
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
                          controller:
                              sl.get<UpdateProfileCubit>().nameController,
                          validator: (userName) {
                            if (userName == null || userName.isEmpty) {
                              return "Required field!";
                            }
                            return null;
                          },
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
                          validator: (phone) {
                            if (phone == null || phone.isEmpty) {
                              return "Please enter your contact number!";
                            }
                            if (phone.length < 10 || phone.length > 10) {
                              return "Invalid contact number!!";
                            }
                            return null;
                          },
                          controller:
                              sl.get<UpdateProfileCubit>().phoneController,
                          decoration: InputDecoration(
                            hintText: "Phone",
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your address!";
                            }

                            return null;
                          },
                          controller:
                              sl.get<UpdateProfileCubit>().addressController,
                          decoration: InputDecoration(
                            hintText: "Address",
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.edit_outlined),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        width: 255,
                        height: 47,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor:
                                const Color.fromARGB(255, 140, 135, 135),
                            elevation: 5,
                            backgroundColor: AppColor.kMain,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(borderRadiusSecond),
                            ),
                          ),
                          onPressed: () {
                            if (sl
                                .get<UpdateProfileCubit>()
                                .updateProfileFormKey
                                .currentState!
                                .validate()) {
                              sl.get<UpdateProfileCubit>().updateProfile();
                            }
                          },
                          child: Text(
                            "Update",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
