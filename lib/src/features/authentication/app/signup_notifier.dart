import 'package:appwrite/models.dart' show Account;
import 'package:chamting_app/src/features/authentication/domain/states/sign_up_state.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/errors/errors.dart';
import '../../../providers/global_providers.dart';
import '../../../providers/user_provider.dart';
import '../data/auth_repository.dart';

///Signup Notifier Provider
final signupNotifierProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>(
  (ref) => SignUpNotifier(
    authRepository: ref.watch(authRepositoryProvider),
    userNotifier: ref.watch(userProvider.notifier),
  ),
);

class SignUpNotifier extends StateNotifier<SignUpState> {
  late final AuthRepository _authRepository;
  late final UserNotifier _userNotifier;
  SignUpNotifier({
    required AuthRepository authRepository,
    required UserNotifier userNotifier,
  })  : _authRepository = authRepository,
        _userNotifier = userNotifier,
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
      (l) => state = SignUpError(l),
      (r) => state = SignUpSuccess(r),
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
