import 'package:appwrite/models.dart' show Session;
import 'package:chamting_app/src/app/errors/failure.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final Session session;
  LoginSuccess(this.session);
  @override
  List<Object?> get props => [session];
}

class LoginError extends LoginState {
  final Failure failure;
  LoginError(this.failure);
  @override
  List<Object?> get props => [failure];
}
