import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:to_dp_app/call_api/retrofit_dio/model/new_post_model.dart';

part 'post_model_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('posts')
  Future<List<NewPostModel>> getPosts();
}
