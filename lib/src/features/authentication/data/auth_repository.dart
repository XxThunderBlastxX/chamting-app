import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:chamting_app/src/features/authentication/data/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../app/errors/errors.dart';
import '../../../providers/global_providers.dart';

/// Auth repository provider
final authRepositoryProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthRepository(account: account);
});


/// Auth state provider
final authStateProvider = FutureProvider.autoDispose<models.Account?>((ref) async{
  final authRepository = ref.watch(authRepositoryProvider);
  return await authRepository.currentUserAccount();
});

/// Auth repository that implements asbtract class [AuthRepositoryImpl]
class AuthRepository implements AuthRepositoryImpl {
  late final Account _account;
  AuthRepository({required Account account}) : _account = account;

  @override
  Future<models.Account?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEitherVoid signOut({String sessionId = 'current'}) async {
    try {
      await _account.deleteSession(sessionId: sessionId);
      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(message: e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  FutureEither<models.Account> signUpUser(
      {required String email, required String password, String? name}) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        name: name,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(message: e.toString(), stackTrace: stackTrace));
    }
  }

  @override
  FutureEither<models.Session> loginUser(
      {required String email, required String password}) async {
    try {
      models.Session session = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(e.toFailure(stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(message: e.toString(), stackTrace: stackTrace));
    }
  }
}
