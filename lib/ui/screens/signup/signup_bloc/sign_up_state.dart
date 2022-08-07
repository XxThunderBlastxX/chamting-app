part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

//SignUpInitialState is the initial state
class SignUpInitialState extends SignUpState {}

//SignUpSuccessState is the emitted when there is not error encountered
class SignUpSuccessState extends SignUpState {}

//SignUpLoadingState is emitted to show loading on screen
class SignUpLoadingState extends SignUpState {}

//SignUpErrState is emitted when error/exception is encountered
class SignUpErrState extends SignUpState {
  final String? err;

  SignUpErrState({this.err});
}
