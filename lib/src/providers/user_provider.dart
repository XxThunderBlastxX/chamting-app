import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/authentication/domain/models/user_model.dart';

/// User provider
final StateNotifierProvider<UserNotifier, User> userProvider =
    StateNotifierProvider<UserNotifier, User>(
  name: 'userProvider',
  UserNotifier.new,
);

class UserNotifier extends StateNotifier<User> {
  late final Ref ref;
  UserNotifier(this.ref) : super(User());

  ///Set the user
  void setUser(User user) => state = user;

  ///Clear the user
  void clearUser() => state = User();

  ///Update the useproperties
  void updateUserProps({String? id, String? name, String? email}) =>
      state = state.copyWith(id: id, name: name, email: email);
}
