import 'package:json_annotation/json_annotation.dart';

part 'Post.g.dart';

@JsonSerializable()
class Post{
  int index;
  String name;
  String picture;
  String gender;
  int age;
  String email;
  String phone;
  String company;

  Post({
    required this.index,
    required this.name,
    required this.picture,
    required this.gender,
    required this.age,
    required this.email,
    required this.phone,
    required this.company});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}