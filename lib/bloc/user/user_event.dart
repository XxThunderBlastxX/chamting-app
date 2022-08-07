part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserSignOutEvent extends UserEvent {}
