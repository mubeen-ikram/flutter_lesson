import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User{
  final int id;
  final String email;
  final String avatar;
  final String first_name;
  final String last_name;


  User(this.id, this.email, this.avatar, this.first_name, this.last_name);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}