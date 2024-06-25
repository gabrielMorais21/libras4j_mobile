import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:libras4j/data/mappers/create_account_request.dart';
import 'package:libras4j/data/mappers/login_request.dart';
import 'package:libras4j/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:libras4j/data/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio = Dio();

  @override
  Future<Either<DioException, UserModel>> login(
      LoginRequest loginRequest) async {
    // Suas credenciais de autenticação
    String username = 'myappname123';
    String password = 'myappsecret123';

    // Encode as credenciais em base64
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    _dio.options.contentType = Headers.formUrlEncodedContentType;
    _dio.options.headers['Authorization'] = basicAuth;
    try {
      final response = await _dio.post(
        'http://100.26.175.74:8765/hr-oauth/oauth/token',
        data: loginRequest.toJson(),
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      return right(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<DioException, bool>> createAccount(
      CreateAccountRequest createAccountRequest) async {
    try {
      final response = await _dio.post(
        'http://100.26.175.74:7777/users',
        data: createAccountRequest.toJson(),
      );

      return right(response.data != null);
    } on DioException catch (e) {
      return left(e);
    }
  }
}
