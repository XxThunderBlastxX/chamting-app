import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../constants/constants.dart';
import '../../repository/register/register_repository.dart';
import '../../utils/auth.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    // this method is encountered when UserSignOutEvent is added to bloc
    on<UserSignOutEvent>((event, emit) async {
      emit(UserLoadingState());

      await removeToken().then((_) {
        emit(UserSuccessSignOutState());
      });
    });

    // this method is encountered when SignInSubmitEvent is added to bloc
    on<SignInSubmitEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        RegisterRepository regRepo = RegisterRepository(baseUrl: kBaseUrl);
        bool status = await regRepo.signInRepository(
          event.email.toString(),
          event.pass.toString(),
        );
        if (status) {
          emit(SignInSuccessState());
        } else {
          emit(UserErrState(errMsg: "Ops something went wrong !!"));
        }
      } catch (err) {
        emit(UserErrState(errMsg: err.toString()));
      }
    });

    // this method is encountered when SignUpSubmitEvent is added to bloc
    on<SignUpSuccessEvent>((event, emit) async {
      emit(UserLoadingState());
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
          emit(UserErrState(errMsg: "Ops something went wrong !!"));
        }
      } catch (err) {
        emit(UserErrState(errMsg: err.toString()));
      }
    });
  }
}
