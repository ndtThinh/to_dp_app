import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPost([int startIndex = 0]);
}
