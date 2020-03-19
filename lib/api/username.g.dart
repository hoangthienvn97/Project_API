// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Username _$UsernameFromJson(Map<String, dynamic> json) {
  return Username(
    json['id'] as String,
    json['username'] as String,
    json['isValidated'] as bool,
  );
}

Map<String, dynamic> _$UsernameToJson(Username instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'isValidated': instance.isValidated,
    };
