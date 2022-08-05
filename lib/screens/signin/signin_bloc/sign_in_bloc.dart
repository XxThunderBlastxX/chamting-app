import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/constants.dart';
import '../../../repository/register/register_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInSubmitEvent>((event, emit) async {
      emit(SignInLoadingState());

      RegisterRepository regRepo = RegisterRepository(baseUrl: kBaseUrl);

      String? errMsg = await regRepo.signInRepository(
        event.email.toString(),
        event.pass.toString(),
      );

      // print(errMsg);

      if (errMsg == null) {
        emit(SignInSuccessState());
      } else {
        emit(SignInErrState(errMsg: errMsg));
      }
    });
  }
}
