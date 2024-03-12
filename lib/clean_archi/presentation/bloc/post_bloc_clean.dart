import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_dp_app/call_api/bloc/post_event.dart';
import 'package:to_dp_app/call_api/bloc/post_state.dart';
import 'package:to_dp_app/call_api/post_model.dart';
import 'package:to_dp_app/clean_archi/domain/usercase/post_usecae.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_event_clean.dart';
import 'package:to_dp_app/clean_archi/presentation/bloc/post_state_clean.dart';

class PostBlocClean extends Bloc<PostEventClean, PostStateClean> {
  final PostUseCase postUseCase;

  PostBlocClean({required this.postUseCase}) : super(PostStateClean()) {
    on<PostFetchedClean>(_onPostFetched);
  }

  Future<void> _onPostFetched(
      PostFetchedClean event, Emitter<PostStateClean> emit) async {
    if (state.hasReacheMax) return;
    try {
      if (state.status == PostStatusClean.initial) {
        print('init');
        final posts = await postUseCase.getAllPost();
        return emit(state.copyWith(
            mStatus: PostStatusClean.success,
            mPosts: posts,
            mHasReacheMax: false));
      }
      final posts = await postUseCase.getAllPost(state.posts.length);
      print("get more");
      emit(posts.isEmpty
          ? state.copyWith(mPosts: state.posts, mHasReacheMax: true)
          : state.copyWith(
              mStatus: PostStatusClean.success,
              mPosts: List.of(state.posts)..addAll(posts),
              mHasReacheMax: false));
    } catch (e) {
      print('Erorr: $e');
      emit(state.copyWith(mStatus: PostStatusClean.failure));
    }
  }
}
