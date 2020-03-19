import 'package:json_annotation/json_annotation.dart';
part 'username.g.dart';

@JsonSerializable()
class Username {
  final String id;
  final String username;
  final bool isValidated;
  Username(this.id, this.username, this.isValidated);

  factory Username.fromJson(Map<String, dynamic> json) =>
      _$UsernameFromJson(json);
  Map<String, dynamic> toJson() => _$UsernameToJson(this);
}
