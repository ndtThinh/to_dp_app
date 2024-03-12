import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/call_api/bloc/post_event.dart';
import 'package:to_dp_app/call_api/bloc/post_state.dart';
import 'package:to_dp_app/call_api/post_model.dart';

const _postLimit = 10;

class PostBloc extends Bloc<PostEvent, PostState> {
  final Dio dio;

  PostBloc({required this.dio}) : super(PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  Future<void> _onPostFetched(
      PostFetched event, Emitter<PostState> emit) async {
    if (state.hasReacheMax) return;
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        print(('init'));
        return emit(state.copyWith(
            mStatus: PostStatus.success, mPosts: posts, mHasReacheMax: false));
      }

      final posts = await _fetchPosts(state.posts.length);
      print("get more");
      emit(posts.isEmpty
          ? state.copyWith(mPosts: state.posts, mHasReacheMax: true)
          : state.copyWith(
              mStatus: PostStatus.success,
              mPosts: List.of(state.posts)..addAll(posts),
              mHasReacheMax: false));
    } catch (e) {
      print(e);
      emit(state.copyWith(mStatus: PostStatus.failure));
    }
  }

  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    var respone = await dio.get(
        'https://jsonplaceholder.typicode.com/posts?_start=${startIndex}&_limit=$_postLimit');
    if (respone.statusCode == 200) {
      final List<dynamic> responeData = respone.data;
      List<Post> posts = responeData.map((e) => Post.fromJson(e)).toList();
      print('Posts size: ${posts.length}');
      return posts;
    }
    throw Exception('error fetching posts');
  }
}
