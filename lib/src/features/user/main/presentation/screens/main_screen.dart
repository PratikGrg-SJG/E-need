import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/bloc/cubit/get_all_categories_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/home_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/order_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/product/bloc/cubit/get_all_products_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/get_user_cubit/get_user_details_cubit.dart';
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
  void initState() {
    super.initState();
    sl.get<GetAllCategoriesCubit>().getAllCategories();
    sl.get<GetAllProductsCubit>().getAllProducts();
    sl.get<GetUserDetailsCubit>().getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, navState) {
        print("from main :: ${navState.index}");
        return Scaffold(
          body: IndexedStack(
            index: navState.index,
            children: [
              HomeScreen(),
              OrderScreen(),
              WsishListScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBar(),
        );
      },
    );
  }
}
