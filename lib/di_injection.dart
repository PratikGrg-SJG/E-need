import 'package:e_needs/src/features/user/auth/domain/usecases/login_usecase.dart';
import 'package:e_needs/src/features/user/auth/domain/usecases/register_user_usecase.dart';
import 'package:e_needs/src/features/user/auth/presentation/screens/register/cubit/register_cubit.dart';
import 'package:e_needs/src/features/user/main/data/datasources/main_remote_datasource.dart';
import 'package:e_needs/src/features/user/main/data/repositories/main_repository_impl.dart';
import 'package:e_needs/src/features/user/main/domain/repositories/main_repository.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_all_categories_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_all_products_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/get_user_details_usecase.dart';
import 'package:e_needs/src/features/user/main/domain/usecases/update_profile_usecase.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/cubit/counter_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/cubit/nav_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/bloc/cubit/get_all_categories_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/product/bloc/cubit/get_all_products_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/get_user_cubit/get_user_details_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/profile/bloc/update_profile_cubit/update_profile_cubit.dart';
import 'package:get_it/get_it.dart';

import 'src/features/user/auth/data/datasources/auth_remote_datasource.dart';
import 'src/features/user/auth/data/repositories/auth_repository_impl.dart';
import 'src/features/user/auth/domain/repositories/auth_repository.dart';
import 'src/features/user/auth/presentation/screens/login/cubit/login_cubit.dart';
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
}
