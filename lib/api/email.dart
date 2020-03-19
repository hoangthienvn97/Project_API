import 'package:json_annotation/json_annotation.dart';
part 'email.g.dart';

@JsonSerializable()
class Email {
  final String id;
  final String email;
  final bool isValidated;
  Email(this.id, this.email, this.isValidated);

  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
  Map<String, dynamic> toJson() => _$EmailToJson(this);
}
