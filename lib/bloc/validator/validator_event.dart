part of 'validator_bloc.dart';

@immutable
abstract class ValidatorEvent {}

class EmailValidatorEvent extends ValidatorEvent {
  final String? email;

  EmailValidatorEvent(this.email) : super();
}

class PasswordValidatorEvent extends ValidatorEvent {
  final String? pass;

  PasswordValidatorEvent(this.pass) : super();
}

class RewritePasswordEvent extends ValidatorEvent {
  final String? pass;
  final String? rePass;

  RewritePasswordEvent(this.pass, this.rePass) : super();
}

class NameValidatorEvent extends ValidatorEvent {
  final String? name;

  NameValidatorEvent(this.name) : super();
}

class UsernameValidatorEvent extends ValidatorEvent {
  final String? username;

  UsernameValidatorEvent(this.username) : super();
}
