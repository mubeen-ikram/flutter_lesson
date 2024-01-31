// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      index: json['index'] as int,
      name: json['name'] as String,
      picture: json['picture'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
      phone: json['phone'] as String,
      company: json['company'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'picture': instance.picture,
      'gender': instance.gender,
      'age': instance.age,
      'email': instance.email,
      'phone': instance.phone,
      'company': instance.company,
    };
