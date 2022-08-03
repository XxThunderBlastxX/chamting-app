import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/validator.dart';

part 'validator_event.dart';
part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(ValidatorInitial()) {
    on<EmailValidatorEvent>((event, emit) {
      if (validateEmail(event.email) == false) {
        emit(EmailValidatorState("Enter a Valid email"));
      } else {
        emit(ValidatorInitial());
      }
    });

    on<PasswordValidatorEvent>((event, emit) {
      if (validatePassword(event.pass) == false) {
        emit(PasswordValidatorState("Enter a Valid password"));
      } else {
        emit(ValidatorInitial());
      }
    });

    on<RewritePasswordEvent>((event, emit) {
      if (event.pass != event.rePass) {
        emit(ReWritePassState("Enter same password"));
      } else {
        emit(ValidatorInitial());
      }
    });

    on<NameValidatorEvent>((event, emit) {
      if (validateName(event.name) == false) {
        emit(NameValidatorState("Enter a valid name"));
      } else {
        emit(ValidatorInitial());
      }
    });

    on<UsernameValidatorEvent>((event, emit) {
      // TODO - Need to make Username validator
    });
  }
}
