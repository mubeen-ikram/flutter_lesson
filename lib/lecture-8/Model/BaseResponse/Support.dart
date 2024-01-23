import 'package:json_annotation/json_annotation.dart';

part 'Support.g.dart';

@JsonSerializable()
class Support{
  final String url;
  final String text;


  Support(this.url, this.text);

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}