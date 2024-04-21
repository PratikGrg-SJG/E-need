import 'package:e_needs/src/features/user/auth/domain/usecases/login_usecase.dart';
import 'package:e_needs/src/features/user/auth/domain/usecases/register_user_usecase.dart';
import 'package:e_needs/src/features/user/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/cubit/register_cubit.dart';
import 'package:e_needs/src/features/user/main/data/datasources/main_remote_datasource.dart';
import 'package:e_needs/src/features/user/main/data/repositories/main_repository_impl.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/add_order_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/add_to_cart_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_all_categories_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_all_products_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_cart_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_orders_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_products_by_category.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_user_details_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_wishlist_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/search_products_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/update_profile_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/update_quantity_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/update_wishlist_usecase.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/counter_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/nav_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/get_cart_cubit/get_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/update_quantity_cubit/update_quantity_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/bloc/get_products_by_category/get_products_by_category_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/bloc/get_products_cubit/get_all_products_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/add_order_cubit/add_order_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/get_order_cubit/get_orders_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/get_user_cubit/get_user_details_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/update_profile_cubit/update_profile_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/search/bloc/search_bloc.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/update_wishlist_cubit/update_wishlist_cubit.dart';
import 'package:get_it/get_it.dart';

import 'src/features/user/auth/data/datasources/auth_remote_datasource.dart';
import 'src/features/user/auth/data/repositories/auth_repository_impl.dart';
import 'src/features/user/auth/domain/repositories/auth_repository.dart';
import 'src/features/user/auth/presentation/screens/login/cubit/login_cubit.dart';
import 'src/features/user/auth/presentation/screens/otp/cubit/opt_verify_cubit.dart';
import 'src/features/user/main/presentation/screens/components/home/bloc/get_categories_cubit/get_categories_cubit.dart';
import 'src/services/local/secure_storage.dart';
import 'src/services/network/api_handler.dart';

final sl = GetIt.instance; // sl is short for service locator

void initGetIt() {
  sl.registerSingleton<ApiHandler>(ApiHandler());
  sl.registerSingleton<SharedPreference>(SharedPreference());

  datasources();
  repositories();
  usecase();
  cubit();
}

//datasources
void datasources() {
// auth datasource
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<MainRemoteDatasource>(
      () => MainRemoteDatasourceImpl(sl()));
}

//repositories
void repositories() {
  //auth repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<MainRepository>(() => MainRepositoryImpl(sl()));
}

//usecase
void usecase() {
  sl.registerLazySingleton<RegisterUserUsecase>(
      () => RegisterUserUsecase(sl()));
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
  sl.registerLazySingleton<GetAllCategoriesUsecase>(
      () => GetAllCategoriesUsecase(sl()));
  sl.registerLazySingleton<GetAllProductsUsecase>(
      () => GetAllProductsUsecase(sl()));
  sl.registerLazySingleton<GetUserDetailsUsecase>(
      () => GetUserDetailsUsecase(sl()));
  sl.registerLazySingleton<UpdateProfileUsecase>(
      () => UpdateProfileUsecase(sl()));
  sl.registerLazySingleton<AddToCartUsecase>(() => AddToCartUsecase(sl()));
  sl.registerLazySingleton<GetCartUsecase>(() => GetCartUsecase(sl()));
  sl.registerLazySingleton<UpdateQuantityUsecase>(
      () => UpdateQuantityUsecase(sl()));
  sl.registerLazySingleton<GetOrdersUsecase>(() => GetOrdersUsecase(sl()));
  sl.registerLazySingleton<AddOrderUsecase>(() => AddOrderUsecase(sl()));
  sl.registerLazySingleton<GetWishlistUsecase>(() => GetWishlistUsecase(sl()));
  sl.registerLazySingleton<UpdateWishlistUsecase>(
      () => UpdateWishlistUsecase(sl()));
  sl.registerLazySingleton<GetProductsByCategoryUsecase>(
      () => GetProductsByCategoryUsecase(sl()));
  sl.registerLazySingleton<SearchProductsUsecase>(
      () => SearchProductsUsecase(sl()));
  sl.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(sl()));
}

//cubit
void cubit() {
  sl.registerLazySingleton(() => NavCubit());
  sl.registerLazySingleton(() => CounterCubit());
  sl.registerLazySingleton(() => RegisterUserCubit(sl()));
  sl.registerLazySingleton(() => LoginCubit(sl()));
  sl.registerLazySingleton(() => GetAllCategoriesCubit(sl()));
  sl.registerLazySingleton(() => GetAllProductsCubit(sl()));
  sl.registerLazySingleton(() => GetUserDetailsCubit(sl()));
  sl.registerLazySingleton(() => UpdateProfileCubit(sl()));
  sl.registerLazySingleton(() => AddToCartCubit(sl()));
  sl.registerLazySingleton(() => GetCartCubit(sl()));
  sl.registerLazySingleton(() => UpdateQuantityCubit(sl()));
  sl.registerLazySingleton(() => AddOrderCubit(sl()));
  sl.registerLazySingleton(() => GetOrdersCubit(sl()));
  sl.registerLazySingleton(() => GetWishlistCubit(sl()));
  sl.registerLazySingleton(() => UpdateWishlistCubit(sl()));
  sl.registerLazySingleton(() => GetProductsByCategoryCubit(sl()));
  sl.registerLazySingleton(() => SearchBloc(sl()));
  sl.registerLazySingleton(() => VerifyOtpCubit(sl()));
}
