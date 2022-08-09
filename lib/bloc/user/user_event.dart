part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

/*-----------SignOut Event-----------*/

//UserSignOutEvent is the sign out event
class UserSignOutEvent extends UserEvent {}

/*-----------SignIn Events------------*/

//SignInSubmitEvent is an event we get when submit button is pressed
class SignInSubmitEvent extends UserEvent {
  final String? email;
  final String? pass;

  SignInSubmitEvent(this.email, this.pass);
}

/*--------------SignOut Event------------*/

//SignUpSuccessEvent is event encountered when submit button in clicked
class SignUpSuccessEvent extends UserEvent {
  final String? email;
  final String? pass;
  final String? name;
  final String? userName;

  SignUpSuccessEvent({this.name, this.userName, this.pass, this.email});
}
