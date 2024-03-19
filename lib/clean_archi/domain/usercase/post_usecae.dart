import 'package:to_dp_app/clean_archi/di.dart';
import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';
import 'package:to_dp_app/clean_archi/domain/repository/post_repository.dart';

class PostUseCase {
  // final PostRepository repo;
  // PostUseCase({required this.repo});

  //get it
  final repo = getIt<PostRepository>();

  Future<List<PostModel>> getAllPost([int startIndex = 0]) async {
    return await repo.getPost(startIndex);
  }
}
