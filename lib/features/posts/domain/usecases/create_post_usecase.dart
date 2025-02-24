// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:two_website/core/usecases/use_case.dart';
import 'package:two_website/features/posts/domain/entities/post_entity.dart';
import 'package:two_website/features/posts/domain/repos/post_repo.dart';

import '../../../../core/error/failures.dart';

class CreatePostUsecase
    extends UseCase<Future<Either<Failure, PostEntity>>, PostParam> {
  CreatePostUsecase(this.postRepo);
  final PostRepo postRepo;
  @override
  Future<Either<Failure, PostEntity>> call(PostParam param) {
    return postRepo.createPost(param.token, param.image, param.body);
  }
}

class PostParam {
  final String token;
  final Uint8List image;
  final String body;
  PostParam({
    required this.token,
    required this.image,
    required this.body,
  });
}
