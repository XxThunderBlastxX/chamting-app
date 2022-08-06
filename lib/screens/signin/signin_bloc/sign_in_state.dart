part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

//SignInInitialState is the initial state
class SignInInitialState extends SignInState {}

//SignInSuccessState is state emitted when signin is successful
class SignInSuccessState extends SignInState {}

//SignInErrState is state emitted when error is encountered
class SignInErrState extends SignInState {
  final String? errMsg;

  SignInErrState({this.errMsg});
}

//SignInLoadingState is state emitted when SignInSubmitEvent is received
class SignInLoadingState extends SignInState {}
