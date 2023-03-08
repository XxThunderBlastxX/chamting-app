import 'package:appwrite/models.dart' show Session;
import 'package:chamting_app/src/features/authentication/data/auth_repository.dart';
import 'package:chamting_app/src/features/authentication/domain/states/login_state.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/errors/errors.dart';

final loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref.watch(authRepositoryProvider));
});

/// Login notifier or controller for login screen
class LoginNotifier extends StateNotifier<LoginState> {
  late final AuthRepository _authRepository;
  LoginNotifier(this._authRepository) : super(LoginInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = LoginLoading();
    Either<Failure, Session> response =
        await _authRepository.loginUser(email: email, password: password);
    response.fold(
      (l) => state = LoginError(l),
      (r) => state = LoginSuccess(r),
    );
  }

  @override
  bool updateShouldNotify(LoginState old, LoginState current) {
    if (!mounted) {
      return false;
    }
    return super.updateShouldNotify(old, current);
  }
}
