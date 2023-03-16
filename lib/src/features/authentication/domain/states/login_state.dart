import 'package:appwrite/models.dart' show Session;
import 'package:equatable/equatable.dart';

import '../../../../app/errors/failure.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => <Object?>[];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => <Object?>[];
}

class LoginSuccess extends LoginState {
  final Session session;
  LoginSuccess(this.session);
  @override
  List<Object?> get props => <Object?>[session];
}

class LoginError extends LoginState {
  final Failure failure;
  LoginError(this.failure);
  @override
  List<Object?> get props => <Object?>[failure];
}
