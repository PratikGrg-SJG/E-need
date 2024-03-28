import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/login/cubit/login_cubit.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/login/login_screen.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/cubit/register_cubit.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/register_screen.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/welcome/welcome_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/cubit/counter_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/bloc/cubit/get_all_categories_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/home_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/product/bloc/cubit/get_all_products_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/get_user_cubit/get_user_details_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/update_profile_cubit/update_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/user/main/presentation/cubit/cubit/nav_cubit.dart';

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
      ],
      child: MaterialApp(
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
        home: WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
