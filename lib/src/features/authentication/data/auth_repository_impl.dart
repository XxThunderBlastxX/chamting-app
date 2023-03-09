import 'package:appwrite/models.dart';
import 'package:chamting_app/src/app/errors/type_defs.dart';

abstract class AuthRepositoryImpl {
  ///Sign up a new user
  FutureEither<Account> signUpUser({
    required String email,
    required String password,
  });

  ///Login a user
  FutureEither<Session> loginUser({
    required String email,
    required String password,
  });

  ///Get the current user
  Future<Account?> currentUserAccount();

  ///Sign out the user from the session
  FutureEitherVoid signOut();
}
