import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/network/network_connection_checker.dart';
import 'package:two_website/features/posts/data/datasources/posts_local_datasource.dart';
import 'package:two_website/features/posts/data/datasources/posts_remote_datasource.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';
import 'package:two_website/features/posts/domain/entities/reply_entity.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';

class PostRepoImpl extends PostRepo {
  final PostRemoteDatasource postRemoteDatasource;
  final PostsLocalDatasource postsLocalDatasource;
  final NetworkInfo networkInfo;

  PostRepoImpl(
      this.postRemoteDatasource, this.postsLocalDatasource, this.networkInfo);

  @override
  Future<Either<Failure, Unit>> acceptReply(int replyId, String token) {
    return wrapHandling(
      tryCall: () async {
        postRemoteDatasource.acceptReply(token, replyId);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, PostEntity>> createPost(
      String token, Uint8List image, String body) {
    return wrapHandling(
      tryCall: () async {
        final result =
            await postRemoteDatasource.createPost(token, body, image);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deletePost(String token, int postId) {
    return wrapHandling(
      tryCall: () async {
        postRemoteDatasource.deletePost(token, postId);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, ReplyEntity>> replyToPost(
      String fullName, String email, String phone, Uint8List cv, int postId) {
    return wrapHandling(
      tryCall: () async {
        final result = await postRemoteDatasource.replyToPost(
            fullName, email, phone, cv, postId);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<ReplyEntity>>> showPostAcceptedReplies(
      int postId, String token) {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteAcceptedReplies =
              await postRemoteDatasource.showPostAcceptedReplies(token, postId);
          postsLocalDatasource
              .cachePostsAcceptedReply(remoteAcceptedReplies.data);
          return Right(remoteAcceptedReplies.data);
        } else {
          final localReplies =
              await postsLocalDatasource.getCachedAcceptedPostReplies();
          return Right(localReplies);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<ReplyEntity>>> showPostReplies(
      int postId, String token) {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteReplies =
              await postRemoteDatasource.showPostReplies(token, postId);
          postsLocalDatasource.cachePostsReply(remoteReplies.data);
          return Right(remoteReplies.data);
        } else {
          final localReplies =
              await postsLocalDatasource.getCachedPostReplies();
          return Right(localReplies);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<PostEntity>>> showActivePosts() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remotePosts = await postRemoteDatasource.showActivePosts();
          postsLocalDatasource.cacheActivePosts(remotePosts.data);
          return Right(remotePosts.data);
        } else {
          final localPosts = await postsLocalDatasource.getActiveCachedPosts();
          return Right(localPosts);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<PostEntity>>> showUnActivePosts() {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remotePosts = await postRemoteDatasource.showUnActivePosts();
          postsLocalDatasource.cacheUnActivePosts(remotePosts.data);
          return Right(remotePosts.data);
        } else {
          final localPosts =
              await postsLocalDatasource.getUnActiveCachedPosts();
          return Right(localPosts);
        }
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> unActivePosts(String token, int postId) {
    return wrapHandling(
      tryCall: () async {
        final remotePosts =
            await postRemoteDatasource.unActivePosts(token, postId);
        return Right(remotePosts);
      },
    );
  }
}
