part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpSuccessState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpErrState extends SignUpState {
  final String? err;

  SignUpErrState({this.err});
}
