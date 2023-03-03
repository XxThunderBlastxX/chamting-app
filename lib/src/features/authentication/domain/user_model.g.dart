// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      authProvider:
          $enumDecodeNullable(_$AuthProviderEnumMap, json['authProvider']),
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('authProvider', _$AuthProviderEnumMap[instance.authProvider]);
  writeNotNull('email', instance.email);
  return val;
}

const _$AuthProviderEnumMap = {
  AuthProvider.google: 'google',
  AuthProvider.email: 'email',
  AuthProvider.apple: 'apple',
  AuthProvider.facebook: 'facebook',
};

Map<String, dynamic> _$$_UserToJson(_$_User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('authProvider', _$AuthProviderEnumMap[instance.authProvider]);
  writeNotNull('email', instance.email);
  return val;
}
