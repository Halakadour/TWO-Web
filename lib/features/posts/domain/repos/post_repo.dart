import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:two_website/core/error/failures.dart';
import 'package:two_website/core/error/handling_exception_manager.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';
import 'package:two_website/features/posts/domain/entities/reply_entity.dart';

abstract class PostRepo with HandlingExceptionManager {
  Future<Either<Failure, PostEntity>> createPost(
      String token, Uint8List image, String body);
  Future<Either<Failure, Unit>> deletePost(String token, int postId);
  Future<Either<Failure, List<PostEntity>>> showActivePosts();
  Future<Either<Failure, List<PostEntity>>> showUnActivePosts();
  Future<Either<Failure, Unit>> unActivePosts(String token, int postId);
  Future<Either<Failure, ReplyEntity>> replyToPost(
      String fullName, String email, String phone, Uint8List cv, int postId);
  Future<Either<Failure, List<ReplyEntity>>> showPostReplies(
      int postId, String token);
  Future<Either<Failure, Unit>> acceptReply(int replyId, String token);
  Future<Either<Failure, List<ReplyEntity>>> showPostAcceptedReplies(
      int postId, String token);
}
