import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
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

/// Auth repository that implements asbtract class [AuthRepositoryImpl]
class AuthRepository implements AuthRepositoryImpl {
  AuthRepository({required Account account}) : _account = account;
  late final Account _account;

  @override
  Future<model.Account?> currentUserAccount() async {
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
  FutureEither<model.Account> signUpUser(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
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
  FutureEither<model.Session> loginUser(
      {required String email, required String password}) async {
    try {
      model.Session session = await _account.createEmailSession(
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
