import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../repository/register/signup_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSuccessEvent>((event, emit) {
      signUpRepository(
          email: event.email.toString(),
          pass: event.pass.toString(),
          name: event.name.toString(),
          userName: event.userName.toString());
      emit(SignUpSuccessState());
    });
  }
}
