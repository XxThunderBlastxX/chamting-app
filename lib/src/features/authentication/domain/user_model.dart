import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum AuthProvider { google, email, apple, facebook }

@freezed
@JsonSerializable()
class User with _$User {
  const factory User({
    String? id,
    String? name,
    AuthProvider? authProvider,
    String? email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
