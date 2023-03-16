import 'package:appwrite/models.dart' show Account;
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/errors/errors.dart';
import '../../../providers/user_provider.dart';
import '../data/auth_repository.dart';
import '../domain/states/sign_up_state.dart';

///Signup Notifier Provider
final AutoDisposeStateNotifierProvider<SignUpNotifier, SignUpState>
    signupNotifierProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>(
  (AutoDisposeStateNotifierProviderRef<SignUpNotifier, SignUpState> ref) =>
      SignUpNotifier(
    authRepository: ref.watch(authRepositoryProvider),
    userNotifier: ref.watch(userProvider.notifier),
  ),
);

class SignUpNotifier extends StateNotifier<SignUpState> {
  late final AuthRepository _authRepository;
  SignUpNotifier({
    required AuthRepository authRepository,
    required UserNotifier userNotifier,
  })  : _authRepository = authRepository,
        super(SignUpInitial());

  Future<void> signUpUser({
    required String email,
    required String password,
    String? name,
  }) async {
    state = SignUpLoading();
    //TODO: Add name to the request if later on added to the form
    Either<Failure, Account> response = await _authRepository.signUpUser(
      email: email,
      password: password,
      name: name,
    );
    //TODO: Do some session task if it is successful
    // _userNotifier.
    response.fold(
      (Failure l) => state = SignUpError(l),
      (Account r) => state = SignUpSuccess(r),
    );
  }

  @override
  bool updateShouldNotify(SignUpState old, SignUpState current) {
    if (!mounted) {
      return false;
    }
    return super.updateShouldNotify(old, current);
  }
}
