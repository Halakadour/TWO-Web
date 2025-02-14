// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

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
    return postRepo.createPost(param.image, param.body);
  }
}

class PostParam {
  final File image;
  final String body;
  PostParam({
    required this.image,
    required this.body,
  });
}
