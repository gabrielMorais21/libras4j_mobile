import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:libras4j/data/mappers/create_account_request.dart';
import 'package:libras4j/data/mappers/login_request.dart';

import '../models/user_model.dart';

abstract class AuthRepository {
  Future<Either<DioException, UserModel>> login(LoginRequest loginRequest);
  Future<Either<DioException, bool>> createAccount(
      CreateAccountRequest loginRequest);
}
