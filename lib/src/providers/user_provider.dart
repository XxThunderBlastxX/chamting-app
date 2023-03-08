import 'package:chamting_app/src/features/authentication/domain/models/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
