import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/auth.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserSignOutEvent>((event, emit) async {
      emit(UserLoadingState());

      await removeToken().then((_) {
        emit(UserSuccessSignOutState());
      });
    });
  }
}
