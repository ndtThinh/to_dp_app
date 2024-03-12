import 'package:equatable/equatable.dart';
import 'package:to_dp_app/call_api/post_model.dart';

enum PostStatus { initial, success, failure }

class PostState extends Equatable {
  PostStatus status;
  List<Post> posts;
  bool hasReacheMax;

  PostState(
      {this.status = PostStatus.initial,
      this.posts = const <Post>[],
      this.hasReacheMax = false});

  PostState copyWith(
      {PostStatus? mStatus, List<Post>? mPosts, bool? mHasReacheMax}) {
    return PostState(
        status: mStatus ?? status,
        posts: mPosts ?? posts,
        hasReacheMax: mHasReacheMax ?? hasReacheMax);
  }

  @override
  List<Object?> get props => [status, posts, hasReacheMax];
}
