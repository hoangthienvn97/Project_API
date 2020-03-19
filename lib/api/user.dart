import 'package:json_annotation/json_annotation.dart';
import '../api/email.dart';
import '../api/phone.dart';
import '../api/username.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  final String type;
  final String id;
  final int time;
  final List<Phone> phones;
  final List<Username> usernames;
  final String name;
  final String pass;
  final List<Email> emails;
  final bool isDeleted;
  final int timePassChange;
  final String roleSystem;
  final String createdAt;
  final String updateAt;

  User(
      this.type,
      this.id,
      this.time,
      this.phones,
      this.usernames,
      this.name,
      this.pass,
      this.emails,
      this.isDeleted,
      this.timePassChange,
      this.roleSystem,
      this.createdAt,
      this.updateAt);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
