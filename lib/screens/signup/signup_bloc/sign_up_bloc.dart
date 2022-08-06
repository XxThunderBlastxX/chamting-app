import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constants.dart';
import '../../../repository/register/register_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    // this method is encountered when SignUpSubmitEvent is added to bloc
    on<SignUpSuccessEvent>((event, emit) async {
      emit(SignUpLoadingState());
      try {
        RegisterRepository regRepo = RegisterRepository(baseUrl: kBaseUrl);
        bool status = await regRepo.signUpRepository(
            email: event.email.toString(),
            pass: event.pass.toString(),
            name: event.name.toString(),
            userName: event.userName.toString());
        if (status) {
          emit(SignUpSuccessState());
        } else {
          emit(SignUpErrState(err: "Ops something went wrong !!"));
        }
      } catch (err) {
        emit(SignUpErrState(err: err.toString()));
      }
    });
  }
}
