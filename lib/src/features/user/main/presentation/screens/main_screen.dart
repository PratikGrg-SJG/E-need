import 'package:e_needs/src/features/user/main/presentation/screens/components/home/home_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/profile_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/wishlist_screen.dart';
import 'package:e_needs/src/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/nav_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<NavCubit, NavState>(
      listener: (context, state) {
        if (state.status == NavStatus.loading) {
          print("loading");
        }
        if (state.status == NavStatus.success) {
          print("success");
        }
        if (state.index == 5) {
          print("working");
        }
      },
      child: BlocBuilder<NavCubit, NavState>(
        builder: (context, navState) {
          print("from main :: ${navState.index}");
          return Scaffold(
            body: IndexedStack(
              index: navState.index,
              children: [
                HomeScreen(),
                WsishListScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: CustomBottomNavigationBar(),
          );
        },
      ),
    );
  }
}
