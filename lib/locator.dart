import 'package:get_it/get_it.dart';
import 'package:libras4j/bloc/auth/auth_cubit.dart';
import 'package:libras4j/bloc/create_account/create_account_cubit.dart';
import 'package:libras4j/data/repositories/auth_repository.dart';
import 'package:libras4j/data/repositories/auth_repository_impl.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepository>()));
  getIt.registerFactory<CreateAccountCubit>(
      () => CreateAccountCubit(getIt<AuthRepository>()));
}
