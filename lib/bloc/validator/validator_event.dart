part of 'validator_bloc.dart';

@immutable
abstract class ValidatorEvent {}

//EmailValidatorEvent is received when email needs to validate
class EmailValidatorEvent extends ValidatorEvent {
  final String? email;

  EmailValidatorEvent(this.email) : super();
}

//PasswordValidatorEvent is received when password needs to validate
class PasswordValidatorEvent extends ValidatorEvent {
  final String? pass;

  PasswordValidatorEvent(this.pass) : super();
}

//RewritePasswordEvent is received when rewrite password needs to validate
class RewritePasswordEvent extends ValidatorEvent {
  final String? pass;
  final String? rePass;

  RewritePasswordEvent(this.pass, this.rePass) : super();
}

//NameValidatorEvent is received when name needs to validate
class NameValidatorEvent extends ValidatorEvent {
  final String? name;

  NameValidatorEvent(this.name) : super();
}

//UsernameValidatorEvent is received when username needs to validate
class UsernameValidatorEvent extends ValidatorEvent {
  final String? username;

  UsernameValidatorEvent(this.username) : super();
}
