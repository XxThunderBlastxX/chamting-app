import 'package:chamting_app/src/features/authentication/domain/user_model.dart';
import 'package:chamting_app/src/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>(
  name: 'userProvider',
  (ref) => UserNotifier(ref),
);
