import 'package:json_annotation/json_annotation.dart';
import 'package:project_example/lecture-8/Model/BaseResponse/Support.dart';

part 'BaseResponse.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final Support support;
  final T data;

  BaseResponse(
      {required this.support,
      required this.data});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object json) fromJsonT) =>
      _$BaseResponseFromJson(json,(json)=> fromJsonT(json!));

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}
