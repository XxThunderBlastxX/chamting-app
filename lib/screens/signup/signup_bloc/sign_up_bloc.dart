import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constants.dart';
import '../../../repository/register/register_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpSuccessEvent>((event, emit) async {
      emit(SignUpLoadingState());

      RegisterRepository regRepo = RegisterRepository(baseUrl: kBaseUrl);
      var errMsg = await regRepo.signUpRepository(
          email: event.email.toString(),
          pass: event.pass.toString(),
          name: event.name.toString(),
          userName: event.userName.toString());

      if (errMsg == null) {
        emit(SignUpSuccessState());
      } else {
        emit(SignUpErrState(err: errMsg.toString()));
      }
    });
  }
}
