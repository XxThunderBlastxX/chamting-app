import 'package:appwrite/models.dart' show Session;
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/errors/errors.dart';
import '../../../providers/user_provider.dart';
import '../data/auth_repository.dart';
import '../domain/states/login_state.dart';

final AutoDisposeStateNotifierProvider<LoginNotifier, LoginState>
    loginNotifierProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
  (AutoDisposeStateNotifierProviderRef<LoginNotifier, LoginState> ref) =>
      LoginNotifier(
    authRepository: ref.watch(authRepositoryProvider),
    userNotifier: ref.watch(userProvider.notifier),
  ),
);

class LoginNotifier extends StateNotifier<LoginState> {
  late final AuthRepository _authRepository;
  late final UserNotifier _userNotifier;
  LoginNotifier({
    required AuthRepository authRepository,
    required UserNotifier userNotifier,
  })  : _authRepository = authRepository,
        _userNotifier = userNotifier,
        super(LoginInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = LoginLoading();
    Either<Failure, Session> response =
        await _authRepository.loginUser(email: email, password: password);
    response.fold(
      (Failure l) => state = LoginError(l),
      (Session r) {
        _userNotifier.updateUserProps(id: r.userId);
        return state = LoginSuccess(r);
      },
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
