// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPostModel _$NewPostModelFromJson(Map<String, dynamic> json) => NewPostModel(
      userId: json['userId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$NewPostModelToJson(NewPostModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
