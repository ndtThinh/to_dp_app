import 'package:equatable/equatable.dart';
import 'package:to_dp_app/call_api/post_model.dart';
import 'package:to_dp_app/clean_archi/domain/entity/post_entityl.dart';

enum PostStatusClean { initial, success, failure }

class PostStateClean extends Equatable {
  PostStatusClean status;
  List<PostModel> posts;
  bool hasReacheMax;

  PostStateClean(
      {this.status = PostStatusClean.initial,
      this.posts = const <PostModel>[],
      this.hasReacheMax = false});

  PostStateClean copyWith(
      {PostStatusClean? mStatus,
      List<PostModel>? mPosts,
      bool? mHasReacheMax}) {
    return PostStateClean(
        status: mStatus ?? status,
        posts: mPosts ?? posts,
        hasReacheMax: mHasReacheMax ?? hasReacheMax);
  }

  @override
  List<Object?> get props => [status, posts, hasReacheMax];
}
