import 'package:dio/dio.dart';
import 'package:to_dp_app/clean_archi/data/remote/api/post_api.dart';
import 'package:to_dp_app/clean_archi/data/remote/dto/post_dto.dart';
import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';

class PostApiEmpl implements PostApi {
  final Dio dio;
  final _postLimit = 10;
  PostApiEmpl({required this.dio});

  @override
  Future<List<PostModel>> getPosts([int startIndex = 0]) async {
    var respone = await dio.get(
        'https://jsonplaceholder.typicode.com/posts?_start=${startIndex}&_limit=$_postLimit');
    if (respone.statusCode == 200) {
      final List<dynamic> responeData = respone.data;
      List<PostModel> posts =
          responeData.map((e) => PostDto.fromMap(e)).toList();
      print('Posts size: ${posts.length}');
      return posts;
    }
    throw Exception('error fetching posts');
  }
}
