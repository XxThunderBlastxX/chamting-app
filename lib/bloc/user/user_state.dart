part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class UserSuccessSignOutState extends UserState {}

class UserErrState extends UserState {}

class UserLoadingState extends UserState {}
