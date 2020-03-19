import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable()
class Company {
  final String id;
   Company(this.id);
  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}