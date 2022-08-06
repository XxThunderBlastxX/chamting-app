import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/validator.dart';

part 'validator_event.dart';
part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(ValidatorInitialState()) {
    //this method is encountered when EmailValidatorEvent is added to bloc
    on<EmailValidatorEvent>((event, emit) {
      if (validateEmail(event.email) == false) {
        emit(EmailValidatorState("Enter a Valid email"));
      } else {
        emit(ValidatorInitialState());
      }
    });

    //this method is encountered when PasswordValidatorEvent is added to bloc
    on<PasswordValidatorEvent>((event, emit) {
      if (validatePassword(event.pass) == false) {
        emit(PasswordValidatorState("Enter a Valid password"));
      } else {
        emit(ValidatorInitialState());
      }
    });

    //this method is encountered when RewritePasswordEvent is added to bloc
    on<RewritePasswordEvent>((event, emit) {
      if (event.pass != event.rePass) {
        emit(ReWritePassState("Enter same password"));
      } else {
        emit(ValidatorInitialState());
      }
    });

    //this method is encountered when NameValidatorEvent is added to bloc
    on<NameValidatorEvent>((event, emit) {
      if (validateName(event.name) == false) {
        emit(NameValidatorState("Enter a valid name"));
      } else {
        emit(ValidatorInitialState());
      }
    });

    //this method is encountered when UsernameValidatorEvent is added to bloc
    on<UsernameValidatorEvent>((event, emit) {
      // TODO - Need to make Username validator
    });
  }
}
