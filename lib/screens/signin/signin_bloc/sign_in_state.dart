part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccessState extends SignInState {}

class SignInErrState extends SignInState {
  final String? errMsg;

  SignInErrState({this.errMsg});
}

class SignInLoadingState extends SignInState {}
