import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:libras4j/data/mappers/login_request.dart';
import 'package:libras4j/data/models/user_model.dart';
import 'package:libras4j/data/repositories/auth_repository.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login({required LoginRequest loginRequest}) async {
    emit(AuthLoading());

    final result = await _authRepository.login(loginRequest);

    result.fold(
      (DioException dioException) => emit(const AuthFailure('Login failed')),
      (UserModel userModel) => emit(AuthSuccess(userModel)),
    );
  }
}
