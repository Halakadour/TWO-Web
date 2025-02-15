import 'package:dartz/dartz.dart';
import 'package:two_website/features/posts/data/models/post_model.dart';
import 'package:two_website/features/posts/data/models/replay_model.dart';

abstract class PostsLocalDatasource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postsList);
  Future<List<ReplyModel>> getCachedPostReplies();
  Future<Unit> cachePostsReply(List<ReplyModel> repliesList);
  Future<List<ReplyModel>> getCachedAcceptedPostReplies();
  Future<Unit> cachePostsAcceptedReply(List<ReplyModel> repliesList);
}
