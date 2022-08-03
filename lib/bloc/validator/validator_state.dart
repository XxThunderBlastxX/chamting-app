part of 'validator_bloc.dart';

@immutable
abstract class ValidatorState {}

class ValidatorInitial extends ValidatorState {}

class EmailValidatorState extends ValidatorState {
  final String err;

  EmailValidatorState(this.err) : super();
}

class PasswordValidatorState extends ValidatorState {
  final String err;

  PasswordValidatorState(this.err) : super();
}

class ReWritePassState extends ValidatorState {
  final String err;
  ReWritePassState(this.err) : super();
}

class NameValidatorState extends ValidatorState {
  final String err;

  NameValidatorState(this.err) : super();
}

class UsernameValidatorState extends ValidatorState {
  final String err;

  UsernameValidatorState(this.err) : super();
}
