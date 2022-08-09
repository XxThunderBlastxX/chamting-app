part of 'user_bloc.dart';

@immutable
abstract class UserState {}

//UserInitialState is the initial state if user
class UserInitialState extends UserState {}

// UserErrState is to show the error state
class UserErrState extends UserState {
  final String? errMsg;

  UserErrState({this.errMsg});
}

// UserLoadingState is the loading state
class UserLoadingState extends UserState {}

/*--------------SignIn States-----------------*/

//SignInSuccessState is state emitted when signin is successful
class SignInSuccessState extends UserState {}

/*--------------SignOut States-----------------*/

class UserSuccessSignOutState extends UserState {}

/*--------------Signup States-----------------*/

//SignUpSuccessState is the emitted when there is not error encountered
class SignUpSuccessState extends UserState {}
