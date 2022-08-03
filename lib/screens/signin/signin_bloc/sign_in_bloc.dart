import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../repository/register/signin_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInSuccessEvent>((event, emit) {
      signInRepository(event.email.toString(), event.pass.toString());
      emit(SignInSuccessState());
    });

    on<SignInErrEvent>((event, emit) {});
  }
}
