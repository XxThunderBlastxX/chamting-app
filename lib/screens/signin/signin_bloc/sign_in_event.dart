part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

//SignInSubmitEvent is an event we get when submit button is pressed
class SignInSubmitEvent extends SignInEvent {
  final String? email;
  final String? pass;

  SignInSubmitEvent(this.email, this.pass);
}
