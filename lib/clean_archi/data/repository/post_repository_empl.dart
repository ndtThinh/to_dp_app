import 'package:to_dp_app/clean_archi/data/remote/api/post_api.dart';
import 'package:to_dp_app/clean_archi/di.dart';
import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';
import 'package:to_dp_app/clean_archi/domain/repository/post_repository.dart';

class PostRepositoryEmpl implements PostRepository {
  // final PostApi postApi;
  // PostRepositoryEmpl({required this.postApi});


  //getit...
  final postApi=getIt<PostApi>();


  @override
  Future<List<PostModel>> getPost([int startIndex = 0]) async {
    List<PostModel> list = await postApi.getPosts(startIndex);
    return list;
  }
}
