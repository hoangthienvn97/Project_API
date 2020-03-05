// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['type'] as String,
    json['id'] as String,
    json['time'] as int,
    (json['phones'] as List)
        ?.map(
            (e) => e == null ? null : Phone.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['usernames'] as List)
        ?.map((e) =>
            e == null ? null : Username.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['name'] as String,
    json['pass'] as String,
    (json['emails'] as List)
        ?.map(
            (e) => e == null ? null : Email.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['isDeleted'] as bool,
    json['timePassChange'] as int,
    json['role_system'] as String,
    json['createdAt'] as String,
    json['updateAt'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'time': instance.time,
      'phones': instance.phones,
      'usernames': instance.usernames,
      'name': instance.name,
      'pass': instance.pass,
      'emails': instance.emails,
      'isDeleted': instance.isDeleted,
      'timePassChange': instance.timePassChange,
      'role_system': instance.roleSystem,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
    };
