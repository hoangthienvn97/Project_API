// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Email _$EmailFromJson(Map<String, dynamic> json) {
  return Email(
    json['id'] as String,
    json['email'] as String,
    json['isValidated'] as bool,
  );
}

Map<String, dynamic> _$EmailToJson(Email instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'isValidated': instance.isValidated,
    };
