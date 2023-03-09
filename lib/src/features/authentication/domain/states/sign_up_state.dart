import 'package:appwrite/models.dart' show Account;
import 'package:equatable/equatable.dart';

import '../../../../app/errors/failure.dart';

abstract class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {
  SignUpInitial();
  @override
  List<String?> get props => [];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends SignUpState {
  final Account account;
  final String successMessage = 'Account created successfully';
  SignUpSuccess(this.account);
  @override
  List<Object> get props => [account,successMessage];
}

class SignUpError extends SignUpState {
  final Failure failure;
  SignUpError(this.failure);
  @override
  List<Failure> get props => [failure];
}
