import 'package:equatable/equatable.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();

  @override
  List<Object?> get props => [];
}

class CreateAccountInitial extends CreateAccountState {}

class CreateAccountLoading extends CreateAccountState {}

class CreateAccountSuccess extends CreateAccountState {
  final bool success;

  const CreateAccountSuccess(this.success);

  @override
  List<Object?> get props => [success];
}

class CreateAccountFailure extends CreateAccountState {
  final String error;

  const CreateAccountFailure(this.error);

  @override
  List<Object?> get props => [error];
}
