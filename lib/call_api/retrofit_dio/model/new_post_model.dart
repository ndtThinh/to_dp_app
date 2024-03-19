import 'package:json_annotation/json_annotation.dart';
part 'new_post_model.g.dart';

@JsonSerializable()
class NewPostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  NewPostModel({this.userId, this.id, this.title, this.body});

  factory NewPostModel.fromJson(Map<String, dynamic> json) =>
      _$NewPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewPostModelToJson(this);
}
