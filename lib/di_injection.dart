import 'package:e_needs/src/features/user/main/presentation/cubit/cubit/counter_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/cubit/cubit/nav_cubit.dart';
import 'package:get_it/get_it.dart';

import 'src/services/local/secure_storage.dart';

final sl = GetIt.instance; // sl is short for service locator

void initGetIt() {
  // sl.registerSingleton<ApiHandler>(ApiHandler());
  sl.registerSingleton<SharedPreference>(SharedPreference());

  datasources();
  repositories();
  usecase();
  cubit();
}

//datasources
void datasources() {
//auth datasource
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //     () => AuthRemoteDataSourceImpl(sl()));
}

//repositories
void repositories() {
  //auth repository
  // sl.registerLazySingleton<AuthRepository>(
  //     () => AuthRepositoryImpl(sl(), sl()));
}

//usecase
void usecase() {
  // sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(sl()));
}

//cubit
void cubit() {
  sl.registerLazySingleton(() => NavCubit());
  sl.registerLazySingleton(() => CounterCubit());
}
