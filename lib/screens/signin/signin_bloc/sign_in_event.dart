part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInSubmitEvent extends SignInEvent {
  final String? email;
  final String? pass;

  SignInSubmitEvent(this.email, this.pass);
}
