part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpSuccessEvent extends SignUpEvent {
  final String? email;
  final String? pass;
  final String? name;
  final String? userName;

  SignUpSuccessEvent({this.name, this.userName, this.pass, this.email});
}
