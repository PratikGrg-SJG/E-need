import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/login/cubit/login_cubit.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/login/login_screen.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/cubit/register_cubit.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/register_screen.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/splash/splash_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/counter_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/get_cart_cubit/get_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/update_quantity_cubit/update_quantity_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/bloc/get_products_cubit/get_all_products_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/home_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/add_order_cubit/add_order_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/get_order_cubit/get_orders_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/order_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/get_user_cubit/get_user_details_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/update_profile_cubit/update_profile_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/update_wishlist_cubit/update_wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import 'src/features/user/main/presentation/cubit/nav_cubit.dart';
import 'src/features/user/main/presentation/screens/components/home/bloc/get_categories_cubit/get_categories_cubit.dart';

class ENeeds extends StatelessWidget {
  const ENeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl.get<NavCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<CounterCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<RegisterUserCubit>(),
          child: RegisterScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<LoginCubit>(),
          child: LoginScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<GetAllCategoriesCubit>(),
          child: HomeScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<GetAllProductsCubit>(),
          child: HomeScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<GetUserDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<UpdateProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<AddToCartCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<GetCartCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<UpdateQuantityCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<GetOrdersCubit>(),
          child: OrderScreen(),
        ),
        BlocProvider(
          create: (context) => sl.get<AddOrderCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<GetWishlistCubit>(),
        ),
        BlocProvider(
          create: (context) => sl.get<UpdateWishlistCubit>(),
        ),
      ],
      child: KhaltiScope(
        publicKey: "test_public_key_d961903dca194e62839f1b511131b9f9",
        enabledDebugging: true,
        builder: (_, navKey) => MaterialApp(
          navigatorKey: navKey,
          localizationsDelegates: [KhaltiLocalizations.delegate],
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.transparent,
            ),
            scaffoldBackgroundColor: AppColor.scaffoldBackground,
            fontFamily: "Roboto",
          ),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
