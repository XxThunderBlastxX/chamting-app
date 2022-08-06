part of 'validator_bloc.dart';

@immutable
abstract class ValidatorState {}

//ValidatorInitialState is the initial state
class ValidatorInitialState extends ValidatorState {}

//EmailValidatorState is emitted when email does not validates
class EmailValidatorState extends ValidatorState {
  final String err;

  EmailValidatorState(this.err) : super();
}

//PasswordValidatorState is emitted when password does not validates
class PasswordValidatorState extends ValidatorState {
  final String err;

  PasswordValidatorState(this.err) : super();
}

//ReWritePassState is emitted when confirm password does not validates
class ReWritePassState extends ValidatorState {
  final String err;
  ReWritePassState(this.err) : super();
}

//NameValidatorState is emitted when name does not validates
class NameValidatorState extends ValidatorState {
  final String err;

  NameValidatorState(this.err) : super();
}

//UsernameValidatorState is emitted when username does not validates
class UsernameValidatorState extends ValidatorState {
  final String err;

  UsernameValidatorState(this.err) : super();
}
