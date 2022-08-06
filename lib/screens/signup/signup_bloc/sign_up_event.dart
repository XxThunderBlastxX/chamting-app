part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

//SignUpSuccessEvent is event encountered when submit button in clicked
class SignUpSuccessEvent extends SignUpEvent {
  final String? email;
  final String? pass;
  final String? name;
  final String? userName;

  SignUpSuccessEvent({this.name, this.userName, this.pass, this.email});
}
