import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';

abstract class PostApi {
  Future<List<PostModel>> getPosts([int startIndex = 0]);
}
