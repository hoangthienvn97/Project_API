import 'package:json_annotation/json_annotation.dart';
part 'phone.g.dart';

@JsonSerializable()
class Phone {
  final String id;
  final String phone;
  final bool isValidated;
  Phone(this.id, this.phone, this.isValidated);

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);
  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}
