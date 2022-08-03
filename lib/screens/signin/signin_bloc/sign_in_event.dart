part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInSuccessEvent extends SignInEvent {
  final String? email;
  final String? pass;

  SignInSuccessEvent(this.email, this.pass);
}

class SignInErrEvent extends SignInEvent {}
