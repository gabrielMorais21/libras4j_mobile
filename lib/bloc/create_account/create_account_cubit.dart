import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:libras4j/bloc/create_account/create_account_state.dart';
import 'package:libras4j/data/mappers/create_account_request.dart';
import 'package:libras4j/data/repositories/auth_repository.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final AuthRepository _authRepository;

  CreateAccountCubit(this._authRepository) : super(CreateAccountInitial());

  Future<void> createAccount(
      {required CreateAccountRequest createAccountRequest}) async {
    emit(CreateAccountLoading());

    final result = await _authRepository.createAccount(createAccountRequest);

    result.fold(
      (DioException dioException) =>
          emit(const CreateAccountFailure('Create Account failed')),
      (bool success) => emit(CreateAccountSuccess(success)),
    );
  }
}
