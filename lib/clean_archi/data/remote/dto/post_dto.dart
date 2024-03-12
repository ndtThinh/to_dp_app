import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';

class PostDto extends PostModel {
  PostDto({super.userId, super.id, super.title, super.body});

  factory PostDto.fromMap(Map<String, dynamic> map) {
    return PostDto(
        userId: map['userId'],
        id: map['id'],
        title: map['title'],
        body: map['body']);
  }
}
